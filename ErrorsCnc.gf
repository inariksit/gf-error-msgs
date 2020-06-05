concrete ErrorsCnc of Errors = open Prelude in {

lincat S, A = SS ;
lin

  thisWorks = ss "no errors here" ;

{- The same error msg for these two -}
--  nonexhaustivePattern = mkSS "foox" ;
--  unsupportedTokenGluing a = ss (a.s + "illegal") ;


{- Happened in linearization of tooManyArgs
   A function type is expected for mkSS2 "too" "many" instead of type {s : Str}

  ** Maybe you gave too many arguments to mkSS2 -}
--  tooManyArgs = mkSS2 "too" "many" "args" ;


{- Happened in linearization of tooFewArgs
    type of mkSS2 "toofew"
   expected: {s : Str}
   inferred: Str -> {s : Str}

** Maybe you gave too few arguments to mkSS2 -}
  tooFewArgs = mkSS2 "toofew" ;

{-gf: Internal error in GeneratePMCFG:
    descend (CStr 0,CNil,CProj (LIdent (Id {rawId2utf8 = "s"})) CNil)

  1) Check that you are not trying to pattern match a /runtime string/.
     These are illegal:
       lin Test foo = case foo.s of {
                         "str" => … } ;   <- explicit matching argument of a lin
       lin Test foo = opThatMatches foo   <- calling an oper that pattern matches

  2) Not about pattern matching? Submit a bug report and we update the error message.
      https://github.com/GrammaticalFramework/gf-core/issues
-}
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
