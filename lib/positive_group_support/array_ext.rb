# 配列 Array への追加機能をまとめたモジュール
module PositiveGroupSupport::ArrayExt

  # @!group 基礎情報

  # 最後の要素の添字（長さ - 1）を取得する．
  # @return [Integer (natural)]
  # @example
  #   [0, 1, 2, 3, 4].last_index => 4
  #   [1, 2, 3, 4, 5].last_index => 4
  #   [0].last_index => 0
  #   [].last_index => -1
  #   [0, 1, 2, 3, 4, 5, 6].last_index => 6
  #   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].last_index => 9
  #   [1, 2, 3, 4, 5, 6].last_index => 5
  #   [1, 2, 3, 4, 5, 6, 7, 8, 9].last_index => 8
  #   [2, 4, 6, 8, 10, 12, 14, 16].last_index => 7
  def last_index
    length - 1
  end

  # 長さの桁数を取得する．
  # @return [Integer (natural)]
  # @note {Numeric#digit} を利用する．
  # @example
  #   ( 1..99 ).map( &:itself ).digit_of_length => 2
  #   ( 1..100 ).map( &:itself ).digit_of_length => 3
  def digit_of_length
    length.digit
  end

  # @!group 重複

  # 重複する要素がないことを判定するメソッド
  # @return [Boolean]
  # @note self.length と self.uniq.length を比較することで判定する．
  # @see http://takuya-1st.hatenablog.jp/entry/20100103/1262486833
  # @example
  #   [1, 1, 2, 3, 5, 8, 13].uniq? => false
  #   [1, 2, 4, 6, 8, 10, 12].uniq? => true
  def uniq?
    length == uniq.length
  end

  # 重複する要素があることを判定するメソッド
  # @return [Boolean]
  # @example
  #   [1, 1, 2, 3, 5, 8, 13].duplicated? => true
  #   [1, 2, 4, 6, 8, 10, 12].duplicated? => false
  def duplicated?
    !( uniq? )
  end

  # 重複する要素の配列を取得するメソッド
  # @return [Array]
  # @see http://takuya-1st.hatenablog.jp/entry/20100103/1262486833
  # @example
  #   [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].duplicated_elements => [1, 2, 3]
  def duplicated_elements
    uniq.select{ |i| index(i) != rindex(i) }
  end

  # 配列内で連続して同じ要素が続いている場合，連続部分での重複を解消する．
  # @todo 説明がしにくい．ドキュメントの重要性を示す例として採用する．
  # @return [Array]
  # @example
  #   [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].unique => [1, 2, 3, 2, 3, 4, 3, 5]
  #
  #   ☆ cf. Array#uniq との違い
  #   [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].uniq => [1, 2, 3, 4, 5]
  def unique
    ary = ::Array.new
    each_with_index{ | element , i |
      unless i > 0 && self[i-1] == element
        ary << element
      end
    }
    ary
  end

  # 長さが n であるか否かを判定する．
  # @param [Integer (natural) or nil] n 自然数を指定する．nil を指定した場合は常に true を返す．
  # @return [Boolean] self の長さが n であるか否かの真偽値
  # @raise [Error] n に自然数でも nil でもないものを与えたときに発生するエラー
  # @example
  #   (1..100).map( &:itself ).length?(100) => true
  #   (1..100).map( &:itself ).as_long_as?(100) => true
  #   (1..100).map( &:itself ).length?(10) => false
  #   (1..100).map( &:itself ).length? => true
  #   (1..100).map( &:itself ).length?( nil ) => true
  #
  #   [1, 1, 2, 3, 5, 8, 13].length?(7) => true
  #   [1, 1, 2, 3, 5, 8, 13].as_long_as?(7) => true
  #   [1, 1, 2, 3, 5, 8, 13].length?(13) => false
  #   [1, 1, 2, 3, 5, 8, 13].length? => true
  #   [1, 1, 2, 3, 5, 8, 13].length?( nil ) => true
  def length?(n=nil)
    if n.nil?
      true
    elsif n.natural_number?
      length == n
    else
      raise "Error: The variable should be a natural number or \"nil\"."
    end
  end

  alias :as_long_as? :length?

  # self の各要素を + で結合して演算を行なった結果を返す．
  # @return [String or Numeric]
  # @note 文字列の配列などにも適用できるという点で {#sum} とは異なる．
  # @example
  #   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sum_improper => 55
  #   ( 1..100 ).map( &:itself ).sum_improper => 5050
  #   ["a", "b", "c", "d", "e", "f", "g"].sum_improper => "abcdefg"
  def sum_improper
    self.inject(:+)
  end

  #  要素を重複ありで n 要素ずつに区切りまとめるメソッド
  # @todo 説明がしにくい．ドキュメントの重要性を示す例として採用する．
  # @return [Array]
  # @example
  #   a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  #
  #   a.cons(2)
  #     => [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]]
  #
  #   a.cons(3)
  #     => [[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [8, 9, 10]]
  #
  #   fukutoshin_line_weekday_express = [ "Wakoshi" , "Kotake-mukaihara" , "Ikebukuro" , "Shinjuku-sanchome" , "Shibuya" ]
  #   fukutoshin_line_weekday_express.cons(2)
  #     => [["Wakoshi","Kotake-mukaihara"], ["Kotake-mukaihara", "Ikebukuro"], ["Ikebukuro", "Shinjuku-sanchome"], ["Shinjuku-sanchome", "Shibuya"]]
  def cons(n)
    each_cons(n).map( &:itself )
  end

end
