package window_size

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	"github.com/go-gl/glfw/v3.3/glfw"
	"log"
)

const (
	CHANNEL_NAME = "github.com/jWinterDay/go_flutter_utils/window_size"
	METHOD = "set_window_size"
)

type WindowSizeFlutterPlugin struct {
	window *glfw.Window
	channel *plugin.MethodChannel
}

var _ flutter.Plugin = &WindowSizeFlutterPlugin{} // compile-time type check
var _ flutter.PluginGLFW = &WindowSizeFlutterPlugin{} // compile-time type check

func (p *WindowSizeFlutterPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	log.Println("***init window size plugin***")
	channel := plugin.NewMethodChannel(messenger, CHANNEL_NAME, plugin.StandardMethodCodec{})
	
	channel.HandleFunc(METHOD, p.setWindowSizeHandler)

	return nil
}

func (p *WindowSizeFlutterPlugin) InitPluginGLFW(window *glfw.Window) error {
	p.window = window

	return nil
}

func (p *WindowSizeFlutterPlugin) setWindowSizeHandler(arguments interface{}) (reply interface{}, err error) {
	argumentsMap := arguments.(map[interface{}]interface{})

	var minW = int(argumentsMap["minW"].(int32))
	var minH = int(argumentsMap["minH"].(int32))
	var maxW = int(argumentsMap["maxW"].(int32))
	var maxH = int(argumentsMap["maxH"].(int32))

	p.window.SetSizeLimits(minW, minH, maxW, maxH);

	return nil, nil
}
