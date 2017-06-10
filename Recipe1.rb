require 'open-uri'
require 'httpclient'
require 'net/ftp'

#2017年6月10日　Ruby勉強会
class Recipe1
  def urlTest
    open("http://www.ruby-lang.org/") {|f|
      f.each_line {|line| p line}
    }
  end
  def httpTest
    client = HTTPClient.new
    client.debug_dev = $stderr    # デバッグ情報を標準エラー出力に
    
    query = {'q' => 'google 検索', 'hl' => 'ja'}
    # get
    res = client.get('https://google.co.jp', :query => query, :follow_redirect => true)
    # post
    #res = client.post('http://httpbin.org/post', :body => query)
    
    puts "code=#{res.code}"    # res.code : Fixnum
    puts HTTP::Status.successful?(res.code)
    p res.headers
    puts res.body
  end
  def ftpTest
    ftp = Net::FTP.new('ftp.example.org')
    ftp.login
    ftp.passive = true
    ftp.chdir('pub/ruby')
    files = ftp.list('ruby*')
    ftp.getbinaryfile('ruby-1.9.1-p243.tar.bz2', 'ruby.bz2', 1024)
    ftp.close
   end
end

#メソッドの呼び出し
recipe = Recipe1.new()
#recipe.urlTest
recipe.ftpTest
