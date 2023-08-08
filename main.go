package main

import (
	"log"
	"os"
	"os/exec"
)

func main() {
	cmd := exec.Command("/app/gpu_burn")

	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err := cmd.Run(); err != nil {
		log.Fatalf("Error: gpu_burn: %v", err)
		return
	}

	log.Println("Success: gpu-burn")
}
