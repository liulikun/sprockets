require 'sprockets_test'
require 'sprockets/yui_compressor'

class TestYUICompressor < Sprockets::TestCase
  test "compress javascript" do
    input = {
      content_type: 'application/javascript',
      data: "function foo() {\n  return true;\n}",
      cache: Sprockets::CacheWrapper.wrap(nil)
    }
    output = "function foo(){return true};"
    assert_equal output, Sprockets::YUICompressor.call(input)
  end

  test "compress css" do
    input = {
      content_type: 'text/css',
      data: "h1 {\n  color: red;\n}\n",
      cache: Sprockets::CacheWrapper.wrap(nil)
    }
    output = "h1{color:red}"
    assert_equal output, Sprockets::YUICompressor.call(input)
  end
end