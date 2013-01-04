/*
* generated by Xtext
*/
grammar InternalProlog;

options {
	superClass=AbstractInternalAntlrParser;
	backtrack=true;
	
}

@lexer::header {
package org.archstudio.prolog.xtext.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.archstudio.prolog.xtext.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.archstudio.prolog.xtext.services.PrologGrammarAccess;

}

@parser::members {

/*
  This grammar contains a lot of empty actions to work around a bug in ANTLR.
  Otherwise the ANTLR tool will create synpreds that cannot be compiled in some rare cases.
*/
 
 	private PrologGrammarAccess grammarAccess;
 	
    public InternalPrologParser(TokenStream input, PrologGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "Program";	
   	}
   	
   	@Override
   	protected PrologGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleProgram
entryRuleProgram returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getProgramRule()); }
	 iv_ruleProgram=ruleProgram 
	 { $current=$iv_ruleProgram.current; } 
	 EOF 
;

// Rule Program
ruleProgram returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getProgramAccess().getClausesClauseParserRuleCall_0_0()); 
	    }
		lv_clauses_0_0=ruleClause		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getProgramRule());
	        }
       		add(
       			$current, 
       			"clauses",
        		lv_clauses_0_0, 
        		"Clause");
	        afterParserOrEnumRuleCall();
	    }

)
)*(
(
		{ 
	        newCompositeNode(grammarAccess.getProgramAccess().getQueryQueryParserRuleCall_1_0()); 
	    }
		lv_query_1_0=ruleQuery		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getProgramRule());
	        }
       		set(
       			$current, 
       			"query",
        		lv_query_1_0, 
        		"Query");
	        afterParserOrEnumRuleCall();
	    }

)
)?)
;





// Entry rule entryRuleClause
entryRuleClause returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getClauseRule()); }
	 iv_ruleClause=ruleClause 
	 { $current=$iv_ruleClause.current; } 
	 EOF 
;

// Rule Clause
ruleClause returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getClauseAccess().getPredicatesExpressionINFParserRuleCall_0_0()); 
	    }
		lv_predicates_0_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getClauseRule());
	        }
       		add(
       			$current, 
       			"predicates",
        		lv_predicates_0_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_1=':-' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getClauseAccess().getColonHyphenMinusKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getClauseAccess().getPredicatesExpressionINFParserRuleCall_1_1_0()); 
	    }
		lv_predicates_2_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getClauseRule());
	        }
       		add(
       			$current, 
       			"predicates",
        		lv_predicates_2_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_3=',' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getClauseAccess().getCommaKeyword_1_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getClauseAccess().getPredicatesExpressionINFParserRuleCall_1_2_1_0()); 
	    }
		lv_predicates_4_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getClauseRule());
	        }
       		add(
       			$current, 
       			"predicates",
        		lv_predicates_4_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))*)?	otherlv_5='.' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getClauseAccess().getFullStopKeyword_2());
    }
)
;





// Entry rule entryRuleQuery
entryRuleQuery returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getQueryRule()); }
	 iv_ruleQuery=ruleQuery 
	 { $current=$iv_ruleQuery.current; } 
	 EOF 
;

// Rule Query
ruleQuery returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='?-' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getQueryAccess().getQuestionMarkHyphenMinusKeyword_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getQueryAccess().getPredicatesExpressionINFParserRuleCall_1_0()); 
	    }
		lv_predicates_1_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getQueryRule());
	        }
       		add(
       			$current, 
       			"predicates",
        		lv_predicates_1_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_2=',' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getQueryAccess().getCommaKeyword_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getQueryAccess().getPredicatesExpressionINFParserRuleCall_2_1_0()); 
	    }
		lv_predicates_3_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getQueryRule());
	        }
       		add(
       			$current, 
       			"predicates",
        		lv_predicates_3_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_4='.' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getQueryAccess().getFullStopKeyword_3());
    }
)
;





// Entry rule entryRuleExpressionINF
entryRuleExpressionINF returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpressionINFRule()); }
	 iv_ruleExpressionINF=ruleExpressionINF 
	 { $current=$iv_ruleExpressionINF.current; } 
	 EOF 
;

// Rule ExpressionINF
ruleExpressionINF returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:

	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpressionINFAccess().getExpression1100ParserRuleCall()); 
    }
    this_Expression1100_0=ruleExpression1100
    { 
        $current = $this_Expression1100_0.current; 
        afterParserOrEnumRuleCall();
    }

;





// Entry rule entryRuleExpression1100
entryRuleExpression1100 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression1100Rule()); }
	 iv_ruleExpression1100=ruleExpression1100 
	 { $current=$iv_ruleExpression1100.current; } 
	 EOF 
;

// Rule Expression1100
ruleExpression1100 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression1100Access().getExpression900ParserRuleCall_0()); 
    }
    this_Expression900_0=ruleExpression900
    { 
        $current = $this_Expression900_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_1100
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression1100Access().getOpsEXPRESSION_1100TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression1100Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_1100");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression1100Access().getExpsExpression900ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression900		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression1100Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression900");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression900
entryRuleExpression900 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression900Rule()); }
	 iv_ruleExpression900=ruleExpression900 
	 { $current=$iv_ruleExpression900.current; } 
	 EOF 
;

// Rule Expression900
ruleExpression900 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_ops_0_0=RULE_EXPRESSION_900
		{
			newLeafNode(lv_ops_0_0, grammarAccess.getExpression900Access().getOpsEXPRESSION_900TerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression900Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_0, 
        		"EXPRESSION_900");
	    }

)
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression900Access().getExpsExpression700ParserRuleCall_1_0()); 
	    }
		lv_exps_1_0=ruleExpression700		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression900Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_1_0, 
        		"Expression700");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleExpression700
entryRuleExpression700 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression700Rule()); }
	 iv_ruleExpression700=ruleExpression700 
	 { $current=$iv_ruleExpression700.current; } 
	 EOF 
;

// Rule Expression700
ruleExpression700 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression700Access().getExpression500ParserRuleCall_0()); 
    }
    this_Expression500_0=ruleExpression500
    { 
        $current = $this_Expression500_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_700
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression700Access().getOpsEXPRESSION_700TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression700Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_700");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression700Access().getExpsExpression500ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression500		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression700Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression500");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleExpression500
entryRuleExpression500 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression500Rule()); }
	 iv_ruleExpression500=ruleExpression500 
	 { $current=$iv_ruleExpression500.current; } 
	 EOF 
;

// Rule Expression500
ruleExpression500 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression500Access().getExpression400ParserRuleCall_0()); 
    }
    this_Expression400_0=ruleExpression400
    { 
        $current = $this_Expression400_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_500
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression500Access().getOpsEXPRESSION_500TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression500Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_500");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression500Access().getExpsExpression400ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression400		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression500Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression400");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression400
entryRuleExpression400 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression400Rule()); }
	 iv_ruleExpression400=ruleExpression400 
	 { $current=$iv_ruleExpression400.current; } 
	 EOF 
;

// Rule Expression400
ruleExpression400 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression400Access().getExpression200ParserRuleCall_0()); 
    }
    this_Expression200_0=ruleExpression200
    { 
        $current = $this_Expression200_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_400
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression400Access().getOpsEXPRESSION_400TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression400Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_400");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression400Access().getExpsExpression200ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression200		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression400Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression200");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression200
entryRuleExpression200 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression200Rule()); }
	 iv_ruleExpression200=ruleExpression200 
	 { $current=$iv_ruleExpression200.current; } 
	 EOF 
;

// Rule Expression200
ruleExpression200 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression200Access().getExpression0ParserRuleCall_0()); 
    }
    this_Expression0_0=ruleExpression0
    { 
        $current = $this_Expression0_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_200
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression200Access().getOpsEXPRESSION_200TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression200Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_200");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression200Access().getExpsExpression0ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression0		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression200Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression0");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression0
entryRuleExpression0 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression0Rule()); }
	 iv_ruleExpression0=ruleExpression0 
	 { $current=$iv_ruleExpression0.current; } 
	 EOF 
;

// Rule Expression0
ruleExpression0 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(((
(
(
		lv_ops_0_1=RULE_ATOM
		{
			newLeafNode(lv_ops_0_1, grammarAccess.getExpression0Access().getOpsATOMTerminalRuleCall_0_0_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_1, 
        		"ATOM");
	    }

    |		lv_ops_0_2=RULE_EXPRESSION_1100
		{
			newLeafNode(lv_ops_0_2, grammarAccess.getExpression0Access().getOpsEXPRESSION_1100TerminalRuleCall_0_0_0_1()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_2, 
        		"EXPRESSION_1100");
	    }

    |		lv_ops_0_3=RULE_EXPRESSION_900
		{
			newLeafNode(lv_ops_0_3, grammarAccess.getExpression0Access().getOpsEXPRESSION_900TerminalRuleCall_0_0_0_2()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_3, 
        		"EXPRESSION_900");
	    }

    |		lv_ops_0_4=RULE_EXPRESSION_700
		{
			newLeafNode(lv_ops_0_4, grammarAccess.getExpression0Access().getOpsEXPRESSION_700TerminalRuleCall_0_0_0_3()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_4, 
        		"EXPRESSION_700");
	    }

    |		lv_ops_0_5=RULE_EXPRESSION_500
		{
			newLeafNode(lv_ops_0_5, grammarAccess.getExpression0Access().getOpsEXPRESSION_500TerminalRuleCall_0_0_0_4()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_5, 
        		"EXPRESSION_500");
	    }

    |		lv_ops_0_6=RULE_EXPRESSION_400
		{
			newLeafNode(lv_ops_0_6, grammarAccess.getExpression0Access().getOpsEXPRESSION_400TerminalRuleCall_0_0_0_5()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_6, 
        		"EXPRESSION_400");
	    }

    |		lv_ops_0_7=RULE_EXPRESSION_200
		{
			newLeafNode(lv_ops_0_7, grammarAccess.getExpression0Access().getOpsEXPRESSION_200TerminalRuleCall_0_0_0_6()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_7, 
        		"EXPRESSION_200");
	    }

)

)
)((
(
		lv_complex_1_0=	'(' 
    {
        newLeafNode(lv_complex_1_0, grammarAccess.getExpression0Access().getComplexLeftParenthesisKeyword_0_1_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed($current, "complex", true, "(");
	    }

)
)((
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getExpsExpressionINFParserRuleCall_0_1_1_0_0()); 
	    }
		lv_exps_2_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_3=',' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getExpression0Access().getCommaKeyword_0_1_1_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getExpsExpressionINFParserRuleCall_0_1_1_1_1_0()); 
	    }
		lv_exps_4_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_4_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))*)?	otherlv_5=')' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getExpression0Access().getRightParenthesisKeyword_0_1_2());
    }
)?)
    |(
(
		lv_number_6_0=RULE_NUMBER
		{
			newLeafNode(lv_number_6_0, grammarAccess.getExpression0Access().getNumberNUMBERTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"number",
        		lv_number_6_0, 
        		"NUMBER");
	    }

)
)
    |(
(
		lv_string_7_0=RULE_STRING
		{
			newLeafNode(lv_string_7_0, grammarAccess.getExpression0Access().getStringSTRINGTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"string",
        		lv_string_7_0, 
        		"STRING");
	    }

)
)
    |(
(
		lv_variable_8_0=RULE_VARIABLE
		{
			newLeafNode(lv_variable_8_0, grammarAccess.getExpression0Access().getVariableVARIABLETerminalRuleCall_3_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"variable",
        		lv_variable_8_0, 
        		"VARIABLE");
	    }

)
)
    |((
(
		lv_list_9_0=	'[' 
    {
        newLeafNode(lv_list_9_0, grammarAccess.getExpression0Access().getListLeftSquareBracketKeyword_4_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed($current, "list", true, "[");
	    }

)
)((
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getHeadExpressionINFParserRuleCall_4_1_0_0()); 
	    }
		lv_head_10_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"head",
        		lv_head_10_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_11=',' 
    {
    	newLeafNode(otherlv_11, grammarAccess.getExpression0Access().getCommaKeyword_4_1_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getHeadExpressionINFParserRuleCall_4_1_1_1_0()); 
	    }
		lv_head_12_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"head",
        		lv_head_12_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))*(	otherlv_13='|' 
    {
    	newLeafNode(otherlv_13, grammarAccess.getExpression0Access().getVerticalLineKeyword_4_1_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getTailExpressionINFParserRuleCall_4_1_2_1_0()); 
	    }
		lv_tail_14_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		set(
       			$current, 
       			"tail",
        		lv_tail_14_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))?)?	otherlv_15=']' 
    {
    	newLeafNode(otherlv_15, grammarAccess.getExpression0Access().getRightSquareBracketKeyword_4_2());
    }
)
    |((
(
		lv_list_16_0=	'.' 
    {
        newLeafNode(lv_list_16_0, grammarAccess.getExpression0Access().getListFullStopKeyword_5_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed($current, "list", true, ".");
	    }

)
)	otherlv_17='(' 
    {
    	newLeafNode(otherlv_17, grammarAccess.getExpression0Access().getLeftParenthesisKeyword_5_1());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getHeadExpressionINFParserRuleCall_5_2_0()); 
	    }
		lv_head_18_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"head",
        		lv_head_18_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_19=',' 
    {
    	newLeafNode(otherlv_19, grammarAccess.getExpression0Access().getCommaKeyword_5_3());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getTailExpressionINFParserRuleCall_5_4_0()); 
	    }
		lv_tail_20_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		set(
       			$current, 
       			"tail",
        		lv_tail_20_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_21=')' 
    {
    	newLeafNode(otherlv_21, grammarAccess.getExpression0Access().getRightParenthesisKeyword_5_5());
    }
)
    |(	otherlv_22='(' 
    {
    	newLeafNode(otherlv_22, grammarAccess.getExpression0Access().getLeftParenthesisKeyword_6_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getExpsExpressionINFParserRuleCall_6_1_0()); 
	    }
		lv_exps_23_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_23_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_24=')' 
    {
    	newLeafNode(otherlv_24, grammarAccess.getExpression0Access().getRightParenthesisKeyword_6_2());
    }
))
;





RULE_EXPRESSION_1100 : ';';

RULE_EXPRESSION_900 : ('\\+'|'not');

RULE_EXPRESSION_700 : ('<'|'='|'=..'|'=@='|'=:='|'=<'|'=='|'=\\='|'>'|'>='|'@<'|'@=<'|'@>'|'@>='|'\\='|'\\=='|'is');

RULE_EXPRESSION_500 : ('+'|'-'|'/\\'|'\\/'|'xor');

RULE_EXPRESSION_400 : ('*'|'/'|'//'|'rdiv'|'<<'|'>>'|'mod'|'rem');

RULE_EXPRESSION_200 : ('**'|'^');

RULE_NUMBER : '-'? ('0'..'9')+;

RULE_ATOM : 'a'..'z' ('0'..'9'|'a'..'z'|'A'..'Z'|'_')*;

RULE_VARIABLE : ('A'..'Z'|'_') ('0'..'9'|'a'..'z'|'A'..'Z'|'_')*;

RULE_STRING : '\'' ('0'..'9'|'a'..'z'|'A'..'Z'|'_'|'+'|'-'|'*'|'/'|'\\'|'^'|'~'|':'|'.'|'?'|'@'|'#'|'$'|'&'|' ')* '\'';

RULE_WHITESPACE : (' '|'\t'|'\r'|'\n')+;

RULE_SINGLE_LINE_COMMENT : '%' ~(('\n'|'\r'))* ('\r'? '\n')?;

