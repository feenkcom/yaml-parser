Class {
	#name : #YAMLParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YAMLParser class >> cacheId [
	^'2023-01-13T15:46:01.09203+01:00'
]

{ #category : #generated }
YAMLParser class >> definitionComment [
"%root Root;
%prefix YAML;
%suffix Node;
%id <INDENT> <DEDENT> ;<newline>
	: \r ? \n
	| \r
	;
<ident_temp>
	: \w+
	;
<cr>	: \r | \n | \r\n ;
<whitespace> : [ \t]+ | \\<cr>;
lineBegin <ident>
# The indent method will generate the right number of INDENT or DEDENT tokens
	: [ \f]+
	;file
	: <newline>* document 'document' <newline>* {{}}
	;
document
	: mappinglist
	;
mappinglist
	: (<newline>* mapping 'mapping' <newline>?)+ {{}}
	;
mapping
	: key 'key' "":"" <newline>+ <INDENT> mappinglist 'mappinglist' <DEDENT> {{}}
	| key 'key' "":"" value 'value'? {{}}
	;
value
	: <ident_temp> 'ident' {{Ident}}
	;
key
	: <ident_temp> 'ident' {{Ident}}
	;"
]

{ #category : #generated }
YAMLParser class >> reduceTable [
^#(
	#(7 0 #nil 295937 false) 
	#(7 2 #liftFirstValue: 295938 false) 
	#(8 1 #liftFirstValue: 347137 false) 
	#(11 1 #reduceActionFor__newline___mapping__mapping___newline____1: 390145 false) 
	#(9 1 #reduceActionFormappinglist1: 374785 false) 
	#(15 1 #reduceActionForkey1: 614401 false) 
	#(10 2 #liftSecondValue: 390145 false) 
	#(6 3 #reduceActionForfile1: 287745 false) 
	#(11 2 #reduceActionFor__newline___mapping__mapping___newline____2: 390146 false) 
	#(10 3 #liftSecondValue: 390146 false) 
	#(12 2 #reduceActionFormapping2: 442370 false) 
	#(13 1 #liftFirstValue: 467969 false) 
	#(14 1 #reduceActionForkey1: 570369 false) 
	#(12 3 #reduceActionFormapping3: 442371 false) 
	#(13 2 #liftFirstValue: 467970 false) 
	#(12 6 #reduceActionFormapping1: 442369 false)
	).
]

{ #category : #generated }
YAMLParser class >> scannerClass [
	^YAMLScanner
]

{ #category : #generated }
YAMLParser class >> startingStateForfile [
	^ 1
]

{ #category : #generated }
YAMLParser class >> symbolNames [
	^ #('":"' '<newline>' '<ident_temp>' '<whitespace>' 'B e g i n' 'file' '<newline>*' 'document' 'mappinglist' '(<newline>* mapping ''mapping'' <newline>?)' '(<newline>* mapping ''mapping'' <newline>?)+' 'mapping' '<newline>+' 'value' 'key' '<DEDENT>' '<INDENT>' 'E O F' 'error')
]

{ #category : #generated }
YAMLParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #YAMLFileNode #YAMLFileNode nil #YAMLMappinglistNode #YAMLMappinglistNode #YAMLMappingNode #OrderedCollection #YAMLMappingNode #SmaCCToken #YAMLIdentNode #YAMLIdentNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YAMLParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 9 0 6 0 13 0 7] 
#[0 0 0 0 18] 
#[1 0 17 0 2 0 6 0 3 0 21 0 7 0 25 0 8 0 25 0 9 0 33 0 10 0 37 0 11] 
#[0 0 10 0 2 0 3 0 18] 
#[1 0 17 0 2 0 41 0 3 0 45 0 12 0 49 0 15] 
#[1 0 6 0 2 0 53 0 7 0 6 0 18] 
#[0 0 14 0 2 0 18] 
#[0 0 18 0 2 0 3 0 16 0 18] 
#[1 0 6 0 2 0 6 0 3 0 21 0 7 0 57 0 10 0 22 0 16 0 22 0 18] 
#[0 0 26 0 1] 
#[1 0 61 0 2 0 30 0 3 0 30 0 16 0 30 0 18] 
#[0 0 65 0 1] 
#[1 0 17 0 2 0 34 0 18] 
#[0 0 38 0 2 0 3 0 16 0 18] 
#[0 0 42 0 2 0 3 0 16 0 18] 
#[1 0 77 0 2 0 73 0 3 0 77 0 13 0 81 0 14 0 46 0 16 0 46 0 18] 
#[0 0 50 0 2 0 17] 
#[0 0 54 0 2 0 3 0 16 0 18] 
#[1 0 85 0 2 0 89 0 17] 
#[0 0 58 0 2 0 3 0 16 0 18] 
#[0 0 62 0 2 0 17] 
#[1 0 6 0 2 0 6 0 3 0 21 0 7 0 93 0 9 0 33 0 10 0 37 0 11] 
#[0 0 97 0 16] 
#[0 0 66 0 2 0 3 0 16 0 18]
	).
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__newline___mapping__mapping___newline____1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__newline___mapping__mapping___newline____2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForfile1: nodes [
	| result |
	result := YAMLFileNode new.
	result document: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionForkey1: nodes [
	| result |
	result := YAMLIdentNode new.
	result ident: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping1: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	result mappinglist: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping2: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping3: nodes [
	| result |
	result := YAMLMappingNode new.
	result key: (nodes at: 1).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormappinglist1: nodes [
	| result |
	result := YAMLMappinglistNode new.
	result addNodes: (nodes at: 1) to: result mappings.
	^ result
]
