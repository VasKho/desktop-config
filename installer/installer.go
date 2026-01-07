package main

import (
	"fmt"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)


const colorReset = "\033[0m"
const colorGreen = "\033[32m\033[1m"
const colorYellow = "\033[33m\033[1m"


type Installer struct {
	config       *ConfigScheme
	iconsDir     string
	themesDir    string
	modulesDir   string
	curDir       string
	buildDir     string
}

func NewInstaller(confPath string) (*Installer, error) {
	conf, err := ParseYaml(confPath); if err != nil {
		return nil, err
	}

	iconsDir := filepath.Join(filepath.Dir(confPath), "icons")
	themesDir := filepath.Join(filepath.Dir(confPath), "themes")

	curDir := "."
	if d, err := os.Getwd(); err == nil {
		curDir = d
	}
	buildDir := filepath.Join(curDir, "tmp"+fmt.Sprintf("%v", rand.Intn(0xffffffffff)))

	installer := Installer { conf,
		iconsDir,
		themesDir,
		filepath.Join(filepath.Dir(confPath), "modules"),
		curDir,
		buildDir }

	return &installer, nil
}

func (i *Installer) Install() error {
	log.Printf("%s%s%s\n", colorGreen, "Starting installation...", colorReset)
	if err := i.prepareSystemConf(); err != nil {
		return err
	}
	log.Println()
	if err := i.makeConfigs(); err != nil {
		return err
	}
	log.Println()
	if err := i.installConfigs(); err != nil {
		i.Clear()
		return err
	}
	log.Println()
	i.Clear()
	log.Printf("%s%s%s\n", colorGreen, "Installation complete.", colorReset)
	return nil
}

func (i *Installer) Clear() error {
	return os.RemoveAll(i.buildDir)
}

func (i *Installer) Symlink(src, dst string) error {
	err := os.Symlink(src, dst); if os.IsExist(err) {
		log.Printf("Symlink already exists: %s. Skipping...\n", dst)
		return nil
	}
	if err == nil {
		log.Printf("Linking %s to %s\n", src, dst)
	}
	return err
}

func (i *Installer) prepareSystemConf() error {
	log.Printf("%s%s%s\n", colorYellow, "[Installing system section]...", colorReset)
	conf := &i.config.System
	if err := generateGtkConf(conf); err != nil {
		return err;
	}

	for _, icon := range []string{conf.Cursor, conf.Icons} {
		iconsDir := filepath.Join(os.Getenv("HOME"), ".icons", icon)
		if err := i.Symlink(filepath.Join(i.iconsDir, icon), iconsDir); err != nil {
			return err
		}
	}

	themeDir := filepath.Join(os.Getenv("HOME"), ".themes", conf.Theme)
	if err := i.Symlink(filepath.Join(i.themesDir, conf.Theme), themeDir); err != nil {
		return err
	}
	log.Printf("%s%s%s\n", colorYellow, "[Done].", colorReset)
	return nil
}

func (i *Installer) makeConfigs() error {
	log.Printf("%s%s%s\n", colorYellow, "[Building configs]...", colorReset)
	for mod, conf := range i.config.Modules {
		log.Printf("Processing %s module config\n", mod)
		if !i.isExportConfigValid(&conf.Export) { continue }
		modDest := filepath.Join(mod, conf.Export.File)
		tmpPath := filepath.Join(i.buildDir, modDest)
		targetFile := filepath.Join(i.modulesDir, modDest)
		if _, err := os.Stat(targetFile); err == nil {
			log.Printf("File already exists: %s. Skipping...\n", targetFile)
			continue
		}

		f, err := createFileWithPath(tmpPath); if err != nil {
			return err
		}

		for feature, val := range conf.Features {
			switch val := val.(type) {
			case map[string]any:
				for p, v := range val {
					str := strings.ReplaceAll(
						conf.Export.Format, "${{key}}", strings.ToUpper(feature + "_" + p))
					str = strings.ReplaceAll(str, "${{value}}", v.(string))
					f.WriteString(str+"\n")
				}
			case string:
				str := strings.ReplaceAll(
					conf.Export.Format, "${{key}}", strings.ToUpper(feature))
				str = strings.ReplaceAll(str, "${{value}}", val)
				f.WriteString(str+"\n")
			}
		}
	}
	log.Printf("%s%s%s\n", colorYellow, "[Done].", colorReset)
	return nil
}

func (i *Installer) installConfigs() error {
	log.Printf("%s%s%s\n", colorYellow, "[Linking to destinations]...", colorReset)
	err := os.CopyFS(i.modulesDir, os.DirFS(i.buildDir))
	if err != nil && !os.IsNotExist(err) {
		return err
	}

	for mod := range i.config.Modules {
		srcDir := filepath.Join(i.modulesDir, mod)
		dstDir := filepath.Join(os.Getenv("XDG_CONFIG_HOME"), mod)
		if err := i.Symlink(srcDir, dstDir); err != nil {
			return err
		}
	}
	log.Printf("%s%s%s\n", colorYellow, "[Done].", colorReset)
	return nil
}

func (i *Installer) isExportConfigValid(conf *ExportConfig) bool {
	if (ExportConfig{}) == *conf {
		log.Println("Export section is empty. Skipping...")
		return false
	}
	if conf.File == "" {
		log.Println("Export file is empty. Skipping...")
		return false
	}
	if conf.Format == "" {
		log.Println("Export format is empty. Skipping...")
		return false
	}
	return true
}



func createFileWithPath(path string) (*os.File, error) {
	if err := os.MkdirAll(filepath.Dir(path), 0750); err != nil {
		return nil, fmt.Errorf("failed to create directories: %w\n", err)
	}

	var f, err = os.Create(path); if err != nil {
		return nil, err
	}
	return f, nil
}

func generateGtkConf(conf *SystemConfig) error {
	cmd := []string {"set", "org.gnome.desktop.interface"}

	theme := conf.Theme
	if conf.DarkMode {
		theme = fmt.Sprintf("%s:Dark", conf.Theme)
	}

	err := exec.Command("gsettings",
		append(cmd, "gtk-theme", theme)...).Run()
	if err != nil { return err }

	err = exec.Command("gsettings",
		append(cmd, "cursor-theme", conf.Cursor)...).Run()
	if err != nil { return err }

	err = exec.Command("gsettings",
		append(cmd, "icon-theme", conf.Icons)...).Run()
	if err != nil { return err }

	err = exec.Command("gsettings",
		append(cmd, "cursor-size", fmt.Sprintf("%v", conf.CursorSize))...).Run()
	if err != nil { return err }

	err = exec.Command("gsettings",
		append(cmd, "font-name", conf.Font)...).Run()
	if err != nil { return err }

	return nil
}
