Class {
	#name : #YAMLParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YAMLParser class >> cacheId [
	^'2023-01-16T16:31:52.09745+01:00'
]

{ #category : #generated }
YAMLParser class >> definitionComment [
"%root Root;
%prefix YAML;
%suffix Node;
%id <INDENT> <DEDENT>  <NEWLINE>;
<NEWLINE>
	: <cr>
	;
<ident_temp>
	: \w+
	;
<cr> : \r | \n | \r\n ;
<whitespace> : [ \t]+ | \\<cr>;
lineBegin <indent>
# The indent method will generate the right number of INDENT or DEDENT tokens
	: [ \f]+
	;
lineBegin <noindent>  : [^ \f] ;
file
	: <NEWLINE>* document 'document' <NEWLINE>* {{}}
	;
document
	: mappinglist
	;
mappinglist
	: (<NEWLINE>* mapping 'mapping' <NEWLINE>?)+ {{mappings}}
	;
mapping
	: key 'key' "":"" <NEWLINE>+ <INDENT> mappinglist 'mappinglist' <DEDENT> {{}}
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
	#(9 0 #nil 333825 false) 
	#(9 2 #liftFirstValue: 333826 false) 
	#(10 1 #liftFirstValue: 385025 false) 
	#(13 1 #reduceActionFor__NEWLINE___mapping__mapping___NEWLINE____1: 428033 false) 
	#(11 1 #reduceActionFormappinglist1: 412673 false) 
	#(17 1 #reduceActionForkey1: 660481 false) 
	#(12 2 #liftSecondValue: 428033 false) 
	#(8 3 #reduceActionForfile1: 325633 false) 
	#(13 2 #reduceActionFor__NEWLINE___mapping__mapping___NEWLINE____2: 428034 false) 
	#(12 3 #liftSecondValue: 428034 false) 
	#(14 2 #reduceActionFormapping2: 488450 false) 
	#(15 1 #liftFirstValue: 514049 false) 
	#(16 1 #reduceActionForkey1: 616449 false) 
	#(14 3 #reduceActionFormapping3: 488451 false) 
	#(15 2 #liftFirstValue: 514050 false) 
	#(14 6 #reduceActionFormapping1: 488449 false)
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
	^ #('":"' '<NEWLINE>' '<ident_temp>' '<whitespace>' '<indent>' '<noindent>' 'B e g i n' 'file' '<NEWLINE>*' 'document' 'mappinglist' '(<NEWLINE>* mapping ''mapping'' <NEWLINE>?)' '(<NEWLINE>* mapping ''mapping'' <NEWLINE>?)+' 'mapping' '<NEWLINE>+' 'value' 'key' '<DEDENT>' '<INDENT>' 'E O F' 'error')
]

{ #category : #generated }
YAMLParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #YAMLFileNode #YAMLFileNode nil #YAMLmappingsNode #YAMLmappingsNode #YAMLMappingNode #OrderedCollection #YAMLMappingNode #SmaCCToken #YAMLIdentNode #YAMLIdentNode #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YAMLParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 9 0 8 0 13 0 9] 
#[0 0 0 0 20] 
#[1 0 17 0 2 0 6 0 3 0 21 0 9 0 25 0 10 0 25 0 11 0 33 0 12 0 37 0 13] 
#[0 0 10 0 2 0 3 0 20] 
#[1 0 17 0 2 0 41 0 3 0 45 0 14 0 49 0 17] 
#[1 0 6 0 2 0 53 0 9 0 6 0 20] 
#[0 0 14 0 2 0 20] 
#[0 0 18 0 2 0 3 0 18 0 20] 
#[1 0 6 0 2 0 6 0 3 0 21 0 9 0 57 0 12 0 22 0 18 0 22 0 20] 
#[0 0 26 0 1] 
#[1 0 61 0 2 0 30 0 3 0 30 0 18 0 30 0 20] 
#[0 0 65 0 1] 
#[1 0 17 0 2 0 34 0 20] 
#[0 0 38 0 2 0 3 0 18 0 20] 
#[0 0 42 0 2 0 3 0 18 0 20] 
#[1 0 77 0 2 0 73 0 3 0 77 0 15 0 81 0 16 0 46 0 18 0 46 0 20] 
#[0 0 50 0 2 0 19] 
#[0 0 54 0 2 0 3 0 18 0 20] 
#[1 0 85 0 2 0 89 0 19] 
#[0 0 58 0 2 0 3 0 18 0 20] 
#[0 0 62 0 2 0 19] 
#[1 0 6 0 2 0 6 0 3 0 21 0 9 0 93 0 11 0 33 0 12 0 37 0 13] 
#[0 0 97 0 18] 
#[0 0 66 0 2 0 3 0 18 0 20]
	).
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__NEWLINE___mapping__mapping___NEWLINE____1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFor__NEWLINE___mapping__mapping___NEWLINE____2: nodes [
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
	result := YAMLmappingsNode new.
	result addNodes: (nodes at: 1) to: result mappings.
	^ result
]
