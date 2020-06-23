module github.com/jWinterDay/go_flutter_utils

go 1.13

replace (
	logger => ./plugins/logger
	os_info => ./plugins/os_info
	window_size => ./plugins/window_size
)

require (
	github.com/go-flutter-desktop/go-flutter v0.41.0
	github.com/go-gl/glfw/v3.3/glfw v0.0.0-20200420212212-258d9bec320e
	github.com/pkg/errors v0.9.1
	logger v0.0.0-00010101000000-000000000000
	os_info v0.0.0-00010101000000-000000000000
	window_size v0.0.0-00010101000000-000000000000
)
