class String
  def yellow
    "\e[93m#{self}\e[0m"
  end
  
  def blue
    "\e[94m#{self}\e[0m"
  end
  
  def purple
    "\e[95m#{self}\e[0m"
  end
  
  def green
    "\e[92m#{self}\e[0m"
  end
  
  def cyan
    "\e[96m#{self}\e[0m"
  end
  
  def red
    "\e[91m#{self}\e[0m"
  end

  def yellow_bg
    "\e[43m#{self}\e[0m"
  end
  
  def blue_bg
    "\e[44m#{self}\e[0m"
  end
  
  def purple_bg
    "\e[45m#{self}\e[0m"
  end
  
  def green_bg
    "\e[42m#{self}\e[0m"
  end
  
  def cyan_bg
    "\e[46m#{self}\e[0m"
  end
  
  def red_bg
    "\e[41m#{self}\e[0m"
  end
end