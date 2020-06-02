package desktop_utils

import (
	"github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/go-flutter/plugin"
	"github.com/go-gl/glfw/v3.3/glfw"
)

const channelName = "jWinterDay/desktop_utils"

type DesktopUtilsFlutterPlugin struct {
	window *glfw.Window
	channel *plugin.MethodChannel
}

var _ flutter.Plugin = &DesktopUtilsFlutterPlugin{} // compile-time type check
var _ flutter.PluginGLFW = &DesktopUtilsFlutterPlugin{} // compile-time type check

func (p *DesktopUtilsFlutterPlugin) InitPlugin(messenger plugin.BinaryMessenger) error {
	channel := plugin.NewMethodChannel(messenger, channelName, plugin.StandardMethodCodec{})
	
	channel.HandleFunc("set_window_size", p.setWindowSizeHandler)

	return nil
}

func (p *DesktopUtilsFlutterPlugin) InitPluginGLFW(window *glfw.Window) error {
	p.window = window

	return nil
}

func (p *DesktopUtilsFlutterPlugin) setWindowSizeHandler(arguments interface{}) (reply interface{}, err error) {
	argumentsMap := arguments.(map[interface{}]interface{})

	var minW = int(argumentsMap["minW"].(int32))
	var minH = int(argumentsMap["minH"].(int32))
	var maxW = int(argumentsMap["maxW"].(int32))
	var maxH = int(argumentsMap["maxH"].(int32))

	p.window.SetSizeLimits(minW, minH, maxW, maxH);

	return nil, nil
}
