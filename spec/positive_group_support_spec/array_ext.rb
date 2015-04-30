describe PositiveGroupSupport do
  it "has method \#last_index" do
    expect( [0,1,2,3,4].last_index ).to eq(4)
    expect( [1,2,3,4,5].last_index ).to eq(4)
    expect( [0].last_index ).to eq(0)
    expect( [].last_index ).to eq(-1)
  end

  it "has method \#digit_of_length" do
    expect( ( 1..99 ).map( &:itself ).digit_of_length ).to eq(2)
    expect( ( 1..100 ).map( &:itself ).digit_of_length ).to eq(3)
  end
end
