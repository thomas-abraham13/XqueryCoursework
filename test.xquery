xquery version "1.0";
<bncDoc>
{
    let $doc := collection("./?select=*xml")
    let $result := $doc//w[matches(.,'has')]
    let $tok := $result//text()/fn:tokenize(fn:normalize-space(.),'\s')
    for $t in distinct-values($tok)
    let $count := count($toks[. = $t])
    return element {$t} 
    {
        attribute count { $count }
    }
}
</bncDoc>