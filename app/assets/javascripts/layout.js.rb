require 'opal-jquery'
Document.ready? do
  puts Window.height
  puts Window.width
  Element['.something'].on(:click) do |event|
    puts "clicked on: #{event.current_target}"
    event.current_target.effect('fadeOut')
  end
end