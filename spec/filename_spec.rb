# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/spec'

require 'filename'
require 'pathname'

describe Filename do
  it "should create a filename without extension" do
    Filename.new('Gemfile').to_s.must_equal 'Gemfile'
  end
  
  it "should create a filename with extension" do
    Filename.new('image', 'jpg').to_s.must_equal 'image.jpg'
  end
  
  it "should create a filename with more than one extension" do
    Filename.new('index', ['html', 'erb']).to_s.must_equal 'index.html.erb'
  end
  
  it "should create a filename with more than one extension as array and remove nil values" do
    Filename.new('index', ['html', nil, 'erb', nil]).to_s.must_equal 'index.html.erb'
  end
  
  it "should create a filename with more than one extension as arguments and remove nil values" do
    Filename.new('index', 'html', nil, 'erb', nil).to_s.must_equal 'index.html.erb'
  end
  
  it "should create a filename with extension, but without base" do
    Filename.new(nil, 'htaccess').to_s.must_equal '.htaccess'
  end
  
  it "should respond to_path" do
    Filename.new('Gemfile').to_path.must_equal 'Gemfile'
  end
  
  it "should work in combination with Pathname" do
    pathname = Pathname.new('/this/is/a') + Filename.new('test', 'file')
    pathname.to_s.must_equal '/this/is/a/test.file'
  end
  
  it "should parse a string" do
    f = Filename.parse('index.html.erb')
    f.base.must_equal 'index'
    f.extensions.must_equal ['html', 'erb']
  end
  
  it "should parse a string without extension" do
    f = Filename.parse('Gemfile')
    f.base.must_equal 'Gemfile'
    f.extensions.must_equal []
  end
  
  it "should parse a string without basename" do
    f = Filename.parse('.htaccess')
    f.base.must_equal ''
    f.extensions.must_equal ['htaccess']
  end
  
  it "should extend the basename" do
    f = Filename.parse('image.jpg').extend_base('200x200', 'greyscale')
    f.base.must_equal "image_200x200_greyscale"
  end
  
  it "should extend the basename with custom seperator" do
    f = Filename.parse('image.jpg').extend_base('200x200', 'greyscale', seperator: '--')
    f.base.must_equal "image--200x200--greyscale"
  end
  
  it "should extend the basename and strip stupid values" do
    f = Filename.parse('image.jpg').extend_base('  200x200 ', nil, 'greyscale', '  ', 1)
    f.base.must_equal "image_200x200_greyscale_1"
  end
  
end