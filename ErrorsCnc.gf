concrete ErrorsCnc of Errors = open Prelude in {

lincat S, A = SS ;
lin

  thisWorks = ss "no errors here" ;
--  nonexhaustivePattern = mkSS "foox" ;
--  unsupportedTokenGluing a = ss (a.s + "illegal") ;
--  tooManyArgs = mkSS2 "too" "many" "args" ;
--  tooFewArgs = mkSS2 "toofew" ;
--  patternMatchingRuntime a = ss (case a.s of {"foo" => "bar"}) ;

oper

  mkSS : Str -> SS = \str ->
    case str of {
      x + "foo" => ss (x + "bar")
  } ;

  mkSS2 : Str -> Str -> SS = \str,dummy -> ss str ;

{- Happened in operation mkSSTooManyInTypeSignature
     type of ss x
    expected: Str -> {s : Str}
    inferred: {s : Str}

 ** Double-check that type signature and number of arguments match. -}

  mkSSTooManyInTypeSignature : Str -> Str -> SS = \x -> ss x ;

{- Happened in operation mkSSTooFewInTypeSignature
   function type expected instead of {s : Str}

** Double-check that the type signature of the operation
   matches the number of arguments given to it.-}
  mkSSTooFewInTypeSignature : Str -> SS = \x,y -> ss x ;

}
