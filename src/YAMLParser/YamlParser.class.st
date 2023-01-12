Class {
	#name : #YAMLParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YAMLParser class >> cacheId [
	^'2023-01-12T16:36:51.13938+01:00'
]

{ #category : #generated }
YAMLParser class >> definitionComment [
"%root Root;
%prefix YAML;
%suffix Node;<newline>
	: \r ? \n
	| \r
	;
<ident_temp>
	: \w+
	;
<cr>	: \r | \n | \r\n ;
<whitespace> : [ \t]+ | \\<cr>;file
	: <newline>* document 'document' <newline>* {{}}
	;
document
	: mappinglist
	;
mappinglist
	: (<newline>* mapping 'mapping' <newline>?)+ {{}}
	;
mapping
	: key 'key' "":"" value 'value'? {{}}
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
	#(7 0 #nil 160769 false) 
	#(7 2 #liftFirstValue: 160770 false) 
	#(8 1 #liftFirstValue: 211969 false) 
	#(11 1 #reduceActionFor__newline___mapping__mapping___newline____1: 254977 false) 
	#(9 1 #reduceActionFormappinglist1: 239617 false) 
	#(14 1 #reduceActionForkey1: 400385 false) 
	#(10 2 #liftSecondValue: 254977 false) 
	#(6 3 #reduceActionForfile1: 152577 false) 
	#(11 2 #reduceActionFor__newline___mapping__mapping___newline____2: 254978 false) 
	#(10 3 #liftSecondValue: 254978 false) 
	#(12 2 #reduceActionFormapping1: 307201 false) 
	#(13 1 #reduceActionForkey1: 356353 false) 
	#(12 3 #reduceActionFormapping2: 307202 false)
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
	^ #('":"' '<newline>' '<ident_temp>' '<whitespace>' 'B e g i n' 'file' '<newline>*' 'document' 'mappinglist' '(<newline>* mapping ''mapping'' <newline>?)' '(<newline>* mapping ''mapping'' <newline>?)+' 'mapping' 'value' 'key' 'E O F' 'error')
]

{ #category : #generated }
YAMLParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #YAMLFileNode #YAMLFileNode nil #YAMLMappinglistNode #YAMLMappinglistNode #YAMLMappingNode #OrderedCollection #YAMLMappingNode #YAMLIdentNode #YAMLIdentNode #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YAMLParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 9 0 6 0 13 0 7] 
#[0 0 0 0 15] 
#[1 0 17 0 2 0 6 0 3 0 21 0 7 0 25 0 8 0 25 0 9 0 33 0 10 0 37 0 11] 
#[0 0 10 0 2 0 3 0 15] 
#[1 0 17 0 2 0 41 0 3 0 45 0 12 0 49 0 14] 
#[1 0 6 0 2 0 53 0 7 0 6 0 15] 
#[0 0 14 0 2 0 15] 
#[0 0 18 0 2 0 3 0 15] 
#[1 0 22 0 2 0 6 0 3 0 21 0 7 0 57 0 10 0 22 0 15] 
#[0 0 26 0 1] 
#[1 0 61 0 2 0 30 0 3 0 30 0 15] 
#[0 0 65 0 1] 
#[1 0 17 0 2 0 34 0 15] 
#[0 0 38 0 2 0 3 0 15] 
#[0 0 42 0 2 0 3 0 15] 
#[1 0 46 0 2 0 69 0 3 0 73 0 13 0 46 0 15] 
#[0 0 50 0 2 0 3 0 15] 
#[0 0 54 0 2 0 3 0 15]
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
	^ result
]

{ #category : #'generated-reduction actions' }
YAMLParser >> reduceActionFormapping2: nodes [
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
