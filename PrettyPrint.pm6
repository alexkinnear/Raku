use v6;
unit module PrettyPrint;

sub prettyPrint (@data) is export {
my $solution = "";
  my $x = 0;
  while $x < 272 {
    my $temp = '';
    my $letter = substr(@data, $x, 1);
    while $letter ne "," {
      if $x < chars(@data) {
        $letter = substr(@data, $x, 1);
        $temp = $temp ~ $letter;
      }
      $x++;
    }
    say $temp;

    # Logic for comments
    if $temp.contains("COMMENT") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2) ~ "\n";
    }

    # Logic for keywords
    if $temp.contains("KEYWORD") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2) ~ " ";
    }

    # Logic for variables
    if $temp.contains("VAR") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+2, *-2) ~ " ";
    }

    # Logic for =
    if $temp.contains("ASSIGNOP") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2) ~ " ";
    }

    # Logic for ints
    if $temp.contains("INTEGER") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2);
    }

    # Logic for EOS
    if $temp.contains("EOS") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2) ~ "\n";
    }

    # Logic for (
    if $temp.contains("LPAREN") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2);
    }

    # Logic for )
    if $temp.contains("RPAREN") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2) ~ " ";
    }

    # Logic for compop
    if $temp.contains("COMPOP") {
      if $temp.contains("lt") {
        $solution = $solution ~ "< ";
      }
      if $temp.contains("gt") {
        $solution = $solution ~ "> ";
      }
    }

    # Logic for strings
    if $temp.contains("STRING") {
      my $idx = $temp.index(":");
      $solution = $solution ~ '"' ~ substr($temp, $idx+3, *-4) ~ '"';
    }

    # Logic for {
    if $temp.contains("LBRACE") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+2, *-2) ~ "\n";
    }

    # Logic for {
    if $temp.contains("RBRACE") {
      my $idx = $temp.index(":");
      $solution = $solution ~ substr($temp, $idx+1, *-2);
    }


    



    $x++;
  }
  $x++;
  say "\n";
  return $solution;
}