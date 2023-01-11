Class {
	#name : #YAMLParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YAMLParser class >> cacheId [
	^'2023-01-11T10:21:21.349942+01:00'
]

{ #category : #generated }
YAMLParser class >> definitionComment [
"<newline>
	: \r ? \n
	| \r
	;
<ident_temp>
	: \w+
	;
<cr>	: \r | \n | \r\n ;
<whitespace> : [ \t]+ | \\<cr>;file
	: <newline>* document <newline>*
	;
document
	: mappinglist
	;
mappinglist
	: (<newline>* mapping <newline>?)+
	;
mapping
	: key "":"" value?
	;
value
	: <ident_temp>
	;
key
	: <ident_temp>
	;"
]

{ #category : #generated }
YAMLParser class >> reduceTable [
^#(
	#(7 0 #reduceFor: 119809 false) 
	#(7 2 #reduceFor: 119810 false) 
	#(8 1 #reduceFor: 154625 false) 
	#(11 1 #reduceFor: 197633 false) 
	#(9 1 #reduceFor: 182273 false) 
	#(14 1 #reduceFor: 289793 false) 
	#(10 2 #reduceFor: 197633 false) 
	#(6 3 #reduceFor: 111617 false) 
	#(11 2 #reduceFor: 197634 false) 
	#(10 3 #reduceFor: 197634 false) 
	#(12 2 #reduceFor: 234497 false) 
	#(13 1 #reduceFor: 264193 false) 
	#(12 3 #reduceFor: 234498 false)
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
	^ #('":"' '<newline>' '<ident_temp>' '<whitespace>' 'B e g i n' 'file' '<newline>*' 'document' 'mappinglist' '(<newline>* mapping <newline>?)' '(<newline>* mapping <newline>?)+' 'mapping' 'value' 'key' 'E O F' 'error')
]

{ #category : #generated }
YAMLParser class >> transitionTable [
^#(
#[1 0 6 0 2 0 6 0 3 0 9 0 6 0 13 0 7] 
#[0 0 0 0 15] 
#[1 0 17 0 2 0 6 0 3 0 21 0 7 0 25 0 8 0 29 0 9 0 33 0 10 0 37 0 11] 
#[0 0 10 0 2 0 3 0 15] 
#[1 0 17 0 2 0 41 0 3 0 45 0 12 0 49 0 14] 
#[1 0 6 0 2 0 53 0 7 0 6 0 15] 
#[0 0 14 0 2 0 15] 
#[0 0 18 0 2 0 3 0 15] 
#[1 0 6 0 2 0 6 0 3 0 21 0 7 0 57 0 10 0 22 0 15] 
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
