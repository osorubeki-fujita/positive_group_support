describe PositiveGroupSupport do
  describe ArrayExt do

    describe "\#last_index" do
      it "returns last index of Array when ArrayExt is included in Array" do
        expect( [0,1,2,3,4].last_index ).to eq(4)
        expect( [1,2,3,4,5].last_index ).to eq(4)
        expect( [0].last_index ).to eq(0)
        expect( [].last_index ).to eq(-1)
        expect( [0, 1, 2, 3, 4, 5, 6].last_index ).to eq(6)
        expect( [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].last_index ).to eq(9)
        expect( [1, 2, 3, 4, 5, 6].last_index ).to eq(5)
        expect( [1, 2, 3, 4, 5, 6, 7, 8, 9].last_index ).to eq(8)
        expect( [2, 4, 6, 8, 10, 12, 14, 16].last_index ).to eq(7)
      end
    end

    describe "\#digit_of_length" do
      it "returns digit of length of Array when ArrayExt is included in Array" do
        expect( ( 1..99 ).map( &:itself ).digit_of_length ).to eq(2)
        expect( ( 1..100 ).map( &:itself ).digit_of_length ).to eq(3)
      end
    end

    describe "\#uniq? / \#duplicated?" do
      it "returns whether an array has duplicated elements or not when ArrayExt is included in Array" do
        expect( [1, 1, 2, 3, 5, 8, 13].uniq? ).to eq( false )
        expect( [1, 2, 4, 6, 8, 10, 12].uniq? ).to eq( true )

        expect( [1, 1, 2, 3, 5, 8, 13].duplicated? ).to eq( true )
        expect( [1, 2, 4, 6, 8, 10, 12].duplicated? ).to eq( false )
      end
    end

    describe "\#duplicated_elements" do
      it "returns duplicated elements of an array when ArrayExt is included in Array" do
        expect( [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].duplicated_elements ).to eq( [1, 2, 3] )
      end
    end

    describe "\#unique" do
      it "cancels neighboring and duplicated elements and returns a new array when ArrayExt is included in Array" do
        expect( [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].unique ).to eq( [1, 2, 3, 2, 3, 4, 3, 5] )
        expect( [1, 1, 2, 3, 3, 3, 2, 3, 4, 3, 3, 5].uniq ).to eq( [1, 2, 3, 4, 5] )
      end
    end

    describe "\#length? / \#as_long_as?" do
      it "decides whether the length of an array and the given variables are the same when ArrayExt is included in Array" do
        expect( (1..100).map( &:itself ).length?(100) ).to eq( true )
        expect( (1..100).map( &:itself ).as_long_as?(100) ).to eq( true )
        expect( (1..100).map( &:itself ).length?(10) ).to eq( false )
        expect( (1..100).map( &:itself ).length? ).to eq( true )
        expect( (1..100).map( &:itself ).length?( nil ) ).to eq( true )

        expect( [1, 1, 2, 3, 5, 8, 13].length?(7) ).to eq( true )
        expect( [1, 1, 2, 3, 5, 8, 13].as_long_as?(7) ).to eq( true )
        expect( [1, 1, 2, 3, 5, 8, 13].length?(13) ).to eq( false )
        expect( [1, 1, 2, 3, 5, 8, 13].length? ).to eq( true )
        expect( [1, 1, 2, 3, 5, 8, 13].length?( nil ) ).to eq( true )
      end
    end

    describe "\#sum_improper" do
      it "injects all the elements in an array by \'+\' when ArrayExt is included in Array" do
        expect( [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sum_improper ).to eq( 55 )
        expect( ( 1..100 ).map( &:itself ).sum_improper ).to eq( 5050 )
        expect( ["a", "b", "c", "d", "e", "f", "g"].sum_improper ).to eq( "abcdefg" )
      end
    end
    
    describe "\#cons" do
      it "groups elements in array by \'Enumerable\#each_cons\' when ArrayExt is included in Array" do
        a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        expect( a.cons(2) ).to eq( [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]] )
        expect( a.cons(3) ).to eq( [[1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [8, 9, 10]] )
        fukutoshin_line_weekday_express = [ "Wakoshi" , "Kotake-mukaihara" , "Ikebukuro" , "Shinjuku-sanchome" , "Shibuya" ]
        expect( fukutoshin_line_weekday_express.cons(2) ).to eq( [["Wakoshi","Kotake-mukaihara"], ["Kotake-mukaihara", "Ikebukuro"], ["Ikebukuro", "Shinjuku-sanchome"], ["Shinjuku-sanchome", "Shibuya"]] )
      end
    end

  end
end
