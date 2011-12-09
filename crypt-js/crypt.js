// crypt.js
// Richard Kernahan <kernighan_rich@rubyforge.org>


// encryption counters and material
var round = 0;
var cryptSet = [ 
//    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
//    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
//    '1','2','3','4','5','6','7','8','9','0',
    '&euro;', '&yen;', '&image;', '&para;', '&sect;', '&alefsym;', '&and;', '&loz;', '&Dagger;', 
    '&ang;', '&cap;', '&cup;', '&empty;', '&exist;', '&fnof;', '&forall;', '&isin;', '&micro;',
    '&nabla;', '&oplus;', '&otimes;', '&part;', '&prod;', '&supe;', '&beta;', '&Delta;', '&Lambda;',
    '&lambda;', '&mu;', '&Omega;', '&omega;', '&Phi;', '&phi;', '&Pi;', '&psi;', '&Sigma;', '&Sigma;', '&Theta;', '&xi;',
    '&yuml;', '&uuml;', '&AElig;', '&aring;', '&atilde;', '&eacute;', '&ecirc;', '&ETH;', '&ocirc;',
    '&szlig;', '&thorn;', '&Yacute;', '&ograve;'
    ]; 
var cryptSetSize = cryptSet.length;
var block = new Array(); 
var blockLen = 0;
var plainPositions = new Array();


// return a zero-indexed pseudo-random integer for use as an array index
function randex(n) {
    return (Math.floor(Math.random( ) * n));
}


function cryptify(tagID, maxRounds) {
    // the tagID should be equal to the plain text inside the html element
    // the maxRounds is the number of randomizing transpositions before the text begins to clear
    var tag = document.getElementById(tagID);
    if (round < 1) { //initialize
        block = tagID.split('');
        blockLen = block.length;
        var i;
        plainPositions = new Array();
        for (i=0; i < blockLen; i++) { plainPositions[i] =  i }
    }
    if (round >= maxRounds) {
        if (plainPositions.length == 0) {
            round = 0;
            return;
        } else {
            var r = randex(plainPositions.length);
            var posToClear = plainPositions[r];
            block[posToClear] = tagID.charAt(posToClear);
            plainPositions.splice(r,1);
            tag.innerHTML = block.join(''); 
            setTimeout("cryptify('" + tagID + "', " + maxRounds + ")", 120);
        }
    } else {
        block[randex(blockLen)] = cryptSet[randex(cryptSetSize)];
        tag.innerHTML = block.join(''); 
        round++;
        setTimeout("cryptify('" + tagID + "', " + maxRounds + ")", 30);
    }
    
}

