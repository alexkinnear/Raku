use v6;
unit module Tokenize;

sub getTokens ($data) is export {
  my $x = 0;
  my $solution = "";

  while $x < chars($data) {
    my $temp = substr($data, $x, 1);

    # Logic for comments
    if $temp eq "#" {
      my $start = $x;
      my $counter = 0;
      while $temp ne "\n" {
        $counter++;
        $x++;
        $temp = substr($data, $x, 1);
      }
      my $comment = substr($data, $start, $counter);
      $solution = $solution ~ "COMMENT:" ~ $comment ~ "\n"; 
    }

    $temp = substr($data, $x, 1);

    # Logic for keyword my
    if $temp eq "m" {
      my $test = substr($data, $x, 2);
      if $test eq "my" {
        $solution = $solution ~ "KEYWORD:my" ~ "\n";  
      }
    }

    $temp = substr($data, $x, 1);

    # Logic for variables
    if $temp eq "\$" {
      my $test = substr($data, $x, 2);
      $x++;
      $solution = $solution ~ "VAR:" ~ $test ~ "\n";
    }

    $temp = substr($data, $x, 1);

    # Logic for = operator
    if $temp eq "=" {
      $solution = $solution ~ "ASSIGNOP:" ~ $temp ~ "\n";
      $x++;
    }

    $temp = substr($data, $x, 1);

    # Logic for EOS
    if $temp eq ";" {
      $solution = $solution ~ "EOS:" ~ $temp ~ "\n";
      $x++;
    }

    $temp = substr($data, $x, 1);

    # Logic for keyword if
    if $temp eq "i" {
      my $test = substr($data, $x, 2);
      if $test eq "if" {
        $solution = $solution ~ "KEYWORD:if" ~ "\n";  
      }
      $x++;
    }

    $temp = substr($data, $x, 1);

    # Logic for (
    if $temp eq "(" {
      $solution = $solution ~ "LPAREN:" ~ $temp ~ "\n";
      #$x++;
    }

    $temp = substr($data, $x, 1);

    # Logic for )
    if $temp eq ")" {
      $solution = $solution ~ "RPAREN:" ~ $temp ~ "\n";
      $x++;
    }

    $temp = substr($data, $x, 1);
    
    # Logic Comp operator
    if $temp eq "<" {
      my $test = substr($data, $x, 5);
      if $test eq "<lt/>" {
        $solution = $solution ~ "COMPOP:" ~ $test ~ "\n";  
        $x = $x + 4;
      }
    }

    $temp = substr($data, $x, 1);

    # Logic Comp operator
    if $temp eq "<" {
      my $test = substr($data, $x, 5);
      if $test eq "<gt/>" {
        $solution = $solution ~ "COMPOP:" ~ $test ~ "\n";  
        $x = $x + 4;
      }
    }

    $temp = substr($data, $x, 1);


    # Logic for {
    if $temp eq "\{" {
      $solution = $solution ~ "LBRACE:" ~ $temp ~ "\n";
      $x++;
    }

    $temp = substr($data, $x, 1);

    # Logic for }
    if $temp eq "\}" {
      $solution = $solution ~ "RBRACE:" ~ $temp ~ "\n";
      $x++;
    }

    # Logic for Strings
    if $temp eq '"' {
      $x++;
      $temp = substr($data, $x, 1);
      my $start = $x;
      my $counter = 0;
      while $temp ne '"' {
        $counter++;
        $x++;
        $temp = substr($data, $x, 1);
      }
      my $comment = substr($data, $start, $counter);
      $solution = $solution ~ "STRING:" ~ '"' ~ $comment ~ '"' ~ "\n"; 
    }

    $temp = substr($data, $x, 1);

    try {
      $temp = $temp.Int;
      if $temp.^name eq "Int" {
        if $temp ne 0 {
          $solution = $solution ~ "INTEGER:" ~ $temp ~ "\n";
        }
      }
    }

    $temp = substr($data, $x, 1);



    
    

    $x++;
  }
  return split("\n", $solution).raku;

}