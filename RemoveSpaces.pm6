use v6;
unit module RemoveSpaces;

sub removeSpaces ($data) is export {

  my $dataSeq = split("\n", $data);

  my $x = 0;
  my $solution = "";
  while $x < elems($dataSeq) {
    my $spaces = $dataSeq[$x].indices(' ');
    my $temp = $dataSeq[$x];

    # check if line is not a comment
    if !$temp.contains("#") {
      if !$temp.contains('"') {
        # remove white space
        with $temp {$_=.comb[(^* ∖ $spaces.flat).keys.sort].join};
      }
      # keep spacing in string in quotes but remove other spacing
      else {
        my $quotes = $temp.indices('"');
        my $partBefore = substr($temp, 0..$quotes[0]);
        my $quotedPart = substr($temp, $quotes[0]+1..$quotes[1]-1);
        my $partAfter = substr($temp, $quotes[1]..chars($temp));
        with $partBefore {$_=.comb[(^* ∖ $partBefore.indices(' ').flat).keys.sort].join};
        with $partAfter {$_=.comb[(^* ∖ $partAfter.indices(' ').flat).keys.sort].join};
        $temp = $partBefore ~ $quotedPart ~ $partAfter;
      }
      
    }
    else {
      # add in newline after the comment
      $temp = $temp ~ "\n";
    }
    
    # add to solution
    $solution = $solution ~ $temp;
    $x++;
  }
  return $solution;
}