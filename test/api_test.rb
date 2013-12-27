require 'test_helper'

class APITest < Markdownr::Test
  def test_markdown_to_html
    post '/api/v2/convert', 'Hello **world**.', {
      'CONTENT_TYPE' => 'text/x-markdown',
      'HTTP_ACCEPT' => 'text/html'
    }
    assert_equal '<p>Hello <strong>world</strong>.</p>', last_response.body

    post '/api/v2/convert', 'Hello **world**.', {
      'CONTENT_TYPE' => 'text/html',
      'HTTP_ACCEPT' => 'text/html'
    }
    assert_equal 400, last_response.status
  end

  def test_html_to_markdown
    post '/api/v2/convert', '<p>Hello <strong>world</strong>.</p>', {
      'CONTENT_TYPE' => 'text/html',
      'HTTP_ACCEPT' => 'text/x-markdown'
    }
    assert_equal 'Hello **world**.', last_response.body

    post '/api/v2/convert', '<p>Hello <strong>world</strong>.</p>', {
      'CONTENT_TYPE' => 'text/html',
      'HTTP_ACCEPT' => 'text/html'
    }
    assert_equal 400, last_response.status
  end

  def test_bad_request
    post '/api/v2/convert'
    assert_equal 400, last_response.status

    post '/api/v2/convert', '<p>Hello <strong>world</strong>.</p>', {
      'CONTENT_TYPE' => 'text/html',
      'HTTP_ACCEPT' => 'image/png'
    }
    assert_equal 406, last_response.status
  end
end
