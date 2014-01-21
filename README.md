# Filename

Simple Filename helper. Works well with Pathname.

## Installation

Add this line to your application's Gemfile:

    gem 'filename'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install filename

## Usage

    Filename.new('Gemfile').to_s
	# 'Gemfile'
	
	Filename.new('image', 'jpeg').to_s
	# 'image.jpg'
    
	Filename.new('image', 'jpg').to_s
	# 'image.jpg'
    
	Filename.new('index', ['html', 'erb']).to_s
	#'index.html.erb'
    
	Filename.new('index', ['html', nil, 'erb', nil]).to_s 
	# 'index.html.erb'
    
	Filename.new(nil, 'htaccess').to_s 
	# '.htaccess'
  
Filename is build to work well with Pathname:

	Pathname.new('/this/is-a') + Filename.new('test', 'file')  
	# '/this/is-a/test.file'

## Contributing

1. Fork it ( http://github.com/<my-github-username>/filename/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
