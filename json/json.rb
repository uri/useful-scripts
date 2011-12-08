require 'json'

readstr = DATA.read

j_ob = JSON readstr

out = JSON.pretty_generate j_ob

open('out.txt', 'w').write out
__END__
{
"employees": [
{ "firstName":"John" , "lastName":"Doe" },
{ "firstName":"Anna" , "lastName":"Smith" },
{ "firstName":"Peter" , "lastName":"Jones" }
]
}