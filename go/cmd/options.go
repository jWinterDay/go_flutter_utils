package main

import (
	"desktop_utils"

	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	"github.com/go-gl/glfw/v3.3/glfw"
)

const (
	InitW = 480 // Samsung Nexus S
	InitH = 800

	MinW = 320 // iPhone 5
	MinH = 568

	MaxW = 5120 // 5K monitor
	MaxH = 4096
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(InitW, InitH),

	flutter.AddPlugin(&desktop_utils.DesktopUtilsFlutterPlugin{}),
}

type ScreenSizeSettings struct {
	window *glfw.Window
}

var _ flutter.Plugin = &ScreenSizeSettings{} // compile-time type check
var _ flutter.PluginGLFW = &ScreenSizeSettings{} // compile-time type check

func (p *ScreenSizeSettings) InitPlugin(messenger plugin.BinaryMessenger) error {
	return nil
}

func (p *ScreenSizeSettings) InitPluginGLFW(window *glfw.Window) error {
	window.SetSizeLimits(MinW, MinH, MaxW, MaxH);

	return nil
}
