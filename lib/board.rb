class Board
  def color_peg(number)
    {
      1 => ' 1 '.yellow,
      2 => ' 2 '.blue,
      3 => ' 3 '.purple,
      4 => ' 4 '.green,
      5 => ' 5 '.cyan,
      6 => ' 6 '.red
    }[number]
  end
end