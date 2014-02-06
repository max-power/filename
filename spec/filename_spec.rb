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
    f.instance_variable_get(:@base).must_equal ['index']
    f.instance_variable_get(:@extensions).must_equal ['html', 'erb']
  end
  
  it "should parse a string without extension" do
    f = Filename.parse('Gemfile')
    f.instance_variable_get(:@base).must_equal ['Gemfile']
    f.instance_variable_get(:@extensions).must_equal []
  end
  
  it "should parse a string without basename" do
    f = Filename.parse('.htaccess')
    f.instance_variable_get(:@base).must_equal []
    f.instance_variable_get(:@extensions).must_equal ['htaccess']
    f.to_s.must_equal '.htaccess'
  end
  
  it "should extend the basename" do
    f = Filename.parse('image.jpg').suffix('200x200', 'greyscale')
    f.to_s.must_equal "image_200x200_greyscale.jpg"
  end
  
  it "should extend the basename with custom seperator" do
    f = Filename.parse('image.jpg').suffix('200x200', 'greyscale', seperator: '--')
    f.to_s.must_equal "image--200x200--greyscale.jpg"
  end
  
  it "should extend the basename and strip stupid values" do
    f = Filename.parse('image.jpg').suffix('  200x200 ', nil, 'greyscale', '  ', 1)
    f.to_s.must_equal "image_200x200_greyscale_1.jpg"
  end
  
  it "should prefix the basename" do
    f = Filename.parse('image.jpg').prefix('thumbnail', 'japan-trip')
    f.to_s.must_equal "thumbnail_japan-trip_image.jpg"
  end
  
  it "should chain prefix und suffix method calls" do
    Filename.parse('cheese.jpg').prefix('old').suffix('cake').to_s.must_equal "old_cheese_cake.jpg"
  end
  
  it "should chain prefix und suffix method calls with custom seperators" do
    Filename.parse('cheese.jpg').prefix('very', seperator: 'old').suffix('cake', 2, seperator: '').to_s.must_equal "veryoldcheesecake2.jpg"
  end
  
end