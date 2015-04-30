# ハッシュ (Hash) のクラスに組み込むモジュール
module PositiveGroupSupport::HashExt

  def sort_keys
    h = ::Hash.new
    self.keys.sort.each do | key |
      h[ key ] = self[ key ]
    end
    h
  end

end