abstract Errors = {

cat S ; A ;
fun
  thisWorks : S ;
  patternMatchingRuntime : A -> S ;
  unsupportedTokenGluing : A -> S ;
  nonexhaustivePattern : A ;
  tooFewArgs, tooManyArgs : A ;
}
