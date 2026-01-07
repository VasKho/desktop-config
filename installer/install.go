package main

import (
	"log"
	"os"
	"path/filepath"
)

func main() {
	log.SetFlags(0)

	if len(os.Args) != 2 {
		log.Fatalf("Usage: %s <yaml-file>\n", os.Args[0])
	}

	path, _ := filepath.Abs(os.Args[1])

	installer, err := NewInstaller(path); if err != nil {
		log.Fatalln(err)
	}

	if err := installer.Install(); err != nil {
		log.Fatalln(err)
	}
}
