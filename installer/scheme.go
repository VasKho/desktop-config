package main

import (
	"os"
	"github.com/goccy/go-yaml"
)

type ConfigScheme struct {
	System SystemConfig               `yaml:"system"`
	Modules map[string]ModuleConfig   `yaml:"modules"`
}

type SystemConfig struct {
	Theme string              `yaml:"theme"`
	Cursor string             `yaml:"cursor"`
	Icons string              `yaml:"icons"`
	CursorSize int            `yaml:"cursor_size"`
	Font string               `yaml:"font"`
	DarkMode bool             `yaml:"dark_mode"`
}

type ModuleConfig struct {
	Export ExportConfig       `yaml:"export"`
	Features map[string]any   `yaml:"features"`
}

type ExportConfig struct {
	Format string             `yaml:"format"`
	File   string             `yaml:"file"`
}

func ParseYaml(filename string) (*ConfigScheme, error) {
	data, err := os.ReadFile(filename); if err != nil {
		return nil, err
	}

	var yamlData ConfigScheme
	if err := yaml.Unmarshal(data, &yamlData); err != nil {
		return nil, err
	}
	return &yamlData, nil
}
