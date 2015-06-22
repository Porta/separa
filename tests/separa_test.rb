require File.expand_path("../lib/separa", File.dirname(__FILE__))

setup do
	
end

test "default separator should be text" do
    sep = Separa.new()
    assert_equal sep.separador, Separa::Text
end

test "Separa::Text should separate words" do
    sep = Separa.new()
    words = "words are something we use"
    result = sep.call(words)
    assert_equal result, %w(words are something we use)
end

test "Separa::Text should accept a regexp" do
    sep = Separa.new(regexp: /\s/)
    words = "words are something we use"
    result = sep.call(words)
    assert_equal result, %w(words are something we use)
end


test "Separa::Text should separate words using another regexp" do
    sep = Separa.new(Separa::Text, regexp: /,/)
    words = "words are something, we use"
    result = sep.call(words)
    assert_equal result, ['words are something',' we use']
end

test "Separa::Text should return an one element array if no split is done" do
    sep = Separa.new(regexp: /,/)
    words = "this is hardcore"
    result = sep.call(words)
    assert_equal result, ['this is hardcore']
end

test "Separa::Obj should be loaded" do
    sep = Separa.new(Separa::Obj)
    assert_equal sep.separador, Separa::Obj
end

test "Separa::Obj should separate Obj into key:value pairs" do
    sep = Separa.new(Separa::Obj)
    h = { uno: 1, dos: 2, tres: {uno: 'one', dos: 'two'} }
    result = sep.call(h)
    assert_equal result, ['uno:1', 'dos:2', 'tres.uno:one', 'tres.dos:two']
end

test "Separa::Obj should separate Obj into key:value pairs" do
    sep = Separa.new(Separa::Obj)
    h = { uno: 1, dos: 2, tres: [:uno, :dos, :tres] }
    result = sep.call(h)    
    assert_equal result, ['uno:1', 'dos:2', 'tres:uno', 'tres:dos', 'tres:tres']
end


test "Separa::Obj should separate Obj into key.value pairs" do
    sep = Separa.new(Separa::Obj, divider: '.')
    h = { uno: 1, dos: 2, tres: {uno: 'one', dos: 'two'} }
    result = sep.call(h)
    assert_equal result, ['uno.1', 'dos.2', 'tres.uno.one', 'tres.dos.two']
end