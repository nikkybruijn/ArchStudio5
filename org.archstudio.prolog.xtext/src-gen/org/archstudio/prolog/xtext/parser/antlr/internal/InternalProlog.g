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
	        newCompositeNode(grammarAccess.getProgramAccess().getExpsExpressionINFParserRuleCall_0_0()); 
	    }
		lv_exps_0_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getProgramRule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_0_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_1='.' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getProgramAccess().getFullStopKeyword_1());
    }
)+
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
        newCompositeNode(grammarAccess.getExpressionINFAccess().getExpression1200ParserRuleCall()); 
    }
    this_Expression1200_0=ruleExpression1200
    { 
        $current = $this_Expression1200_0.current; 
        afterParserOrEnumRuleCall();
    }

;





// Entry rule entryRuleExpression1200
entryRuleExpression1200 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression1200Rule()); }
	 iv_ruleExpression1200=ruleExpression1200 
	 { $current=$iv_ruleExpression1200.current; } 
	 EOF 
;

// Rule Expression1200
ruleExpression1200 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression1200Access().getExpression1200fxParserRuleCall_0()); 
    }
    this_Expression1200fx_0=ruleExpression1200fx
    { 
        $current = $this_Expression1200fx_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_1200
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression1200Access().getOpsEXPRESSION_1200TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression1200Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_1200");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression1200Access().getExpsExpression1200fxParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression1200fx		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression1200Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression1200fx");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleExpression1200fx
entryRuleExpression1200fx returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression1200fxRule()); }
	 iv_ruleExpression1200fx=ruleExpression1200fx 
	 { $current=$iv_ruleExpression1200fx.current; } 
	 EOF 
;

// Rule Expression1200fx
ruleExpression1200fx returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_ops_0_0=RULE_EXPRESSION_1200FX
		{
			newLeafNode(lv_ops_0_0, grammarAccess.getExpression1200fxAccess().getOpsEXPRESSION_1200FXTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression1200fxRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_0, 
        		"EXPRESSION_1200FX");
	    }

)
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression1200fxAccess().getExpsExpression1100ParserRuleCall_1_0()); 
	    }
		lv_exps_1_0=ruleExpression1100		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression1200fxRule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_1_0, 
        		"Expression1100");
	        afterParserOrEnumRuleCall();
	    }

)
))
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
        newCompositeNode(grammarAccess.getExpression1100Access().getExpression1000ParserRuleCall_0()); 
    }
    this_Expression1000_0=ruleExpression1000
    { 
        $current = $this_Expression1000_0.current; 
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
	        newCompositeNode(grammarAccess.getExpression1100Access().getExpsExpression1000ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression1000		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression1100Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression1000");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression1000
entryRuleExpression1000 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression1000Rule()); }
	 iv_ruleExpression1000=ruleExpression1000 
	 { $current=$iv_ruleExpression1000.current; } 
	 EOF 
;

// Rule Expression1000
ruleExpression1000 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression1000Access().getExpression900fxParserRuleCall_0()); 
    }
    this_Expression900fx_0=ruleExpression900fx
    { 
        $current = $this_Expression900fx_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_1000
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression1000Access().getOpsEXPRESSION_1000TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression1000Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_1000");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression1000Access().getExpsExpression900fxParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression900fx		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression1000Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression900fx");
	        afterParserOrEnumRuleCall();
	    }

)
))*)
;





// Entry rule entryRuleExpression900fx
entryRuleExpression900fx returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression900fxRule()); }
	 iv_ruleExpression900fx=ruleExpression900fx 
	 { $current=$iv_ruleExpression900fx.current; } 
	 EOF 
;

// Rule Expression900fx
ruleExpression900fx returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_ops_0_0=RULE_EXPRESSION_900FX
		{
			newLeafNode(lv_ops_0_0, grammarAccess.getExpression900fxAccess().getOpsEXPRESSION_900FXTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression900fxRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_0, 
        		"EXPRESSION_900FX");
	    }

)
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression900fxAccess().getExpsExpression700ParserRuleCall_1_0()); 
	    }
		lv_exps_1_0=ruleExpression700		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression900fxRule());
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
        newCompositeNode(grammarAccess.getExpression700Access().getExpression600ParserRuleCall_0()); 
    }
    this_Expression600_0=ruleExpression600
    { 
        $current = $this_Expression600_0.current; 
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
	        newCompositeNode(grammarAccess.getExpression700Access().getExpsExpression600ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression600		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression700Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_2_0, 
        		"Expression600");
	        afterParserOrEnumRuleCall();
	    }

)
))?)
;





// Entry rule entryRuleExpression600
entryRuleExpression600 returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getExpression600Rule()); }
	 iv_ruleExpression600=ruleExpression600 
	 { $current=$iv_ruleExpression600.current; } 
	 EOF 
;

// Rule Expression600
ruleExpression600 returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
	{ 
	  /* */ 
	}
    { 
        newCompositeNode(grammarAccess.getExpression600Access().getExpression500ParserRuleCall_0()); 
    }
    this_Expression500_0=ruleExpression500
    { 
        $current = $this_Expression500_0.current; 
        afterParserOrEnumRuleCall();
    }
((
(
		lv_ops_1_0=RULE_EXPRESSION_600
		{
			newLeafNode(lv_ops_1_0, grammarAccess.getExpression600Access().getOpsEXPRESSION_600TerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression600Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_1_0, 
        		"EXPRESSION_600");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression600Access().getExpsExpression500ParserRuleCall_1_1_0()); 
	    }
		lv_exps_2_0=ruleExpression500		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression600Rule());
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
))?)
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
))?)
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
))?)
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
		lv_ops_0_1=	'.' 
    {
        newLeafNode(lv_ops_0_1, grammarAccess.getExpression0Access().getOpsFullStopKeyword_0_0_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed($current, "ops", lv_ops_0_1, null);
	    }

    |		lv_ops_0_2=RULE_ATOM
		{
			newLeafNode(lv_ops_0_2, grammarAccess.getExpression0Access().getOpsATOMTerminalRuleCall_0_0_0_1()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_2, 
        		"ATOM");
	    }

    |		lv_ops_0_3=RULE_EXPRESSION_1200
		{
			newLeafNode(lv_ops_0_3, grammarAccess.getExpression0Access().getOpsEXPRESSION_1200TerminalRuleCall_0_0_0_2()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_3, 
        		"EXPRESSION_1200");
	    }

    |		lv_ops_0_4=RULE_EXPRESSION_1200FX
		{
			newLeafNode(lv_ops_0_4, grammarAccess.getExpression0Access().getOpsEXPRESSION_1200FXTerminalRuleCall_0_0_0_3()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_4, 
        		"EXPRESSION_1200FX");
	    }

    |		lv_ops_0_5=RULE_EXPRESSION_1100
		{
			newLeafNode(lv_ops_0_5, grammarAccess.getExpression0Access().getOpsEXPRESSION_1100TerminalRuleCall_0_0_0_4()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_5, 
        		"EXPRESSION_1100");
	    }

    |		lv_ops_0_6=RULE_EXPRESSION_1000
		{
			newLeafNode(lv_ops_0_6, grammarAccess.getExpression0Access().getOpsEXPRESSION_1000TerminalRuleCall_0_0_0_5()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_6, 
        		"EXPRESSION_1000");
	    }

    |		lv_ops_0_7=RULE_EXPRESSION_900FX
		{
			newLeafNode(lv_ops_0_7, grammarAccess.getExpression0Access().getOpsEXPRESSION_900FXTerminalRuleCall_0_0_0_6()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_7, 
        		"EXPRESSION_900FX");
	    }

    |		lv_ops_0_8=RULE_EXPRESSION_700
		{
			newLeafNode(lv_ops_0_8, grammarAccess.getExpression0Access().getOpsEXPRESSION_700TerminalRuleCall_0_0_0_7()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_8, 
        		"EXPRESSION_700");
	    }

    |		lv_ops_0_9=RULE_EXPRESSION_600
		{
			newLeafNode(lv_ops_0_9, grammarAccess.getExpression0Access().getOpsEXPRESSION_600TerminalRuleCall_0_0_0_8()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_9, 
        		"EXPRESSION_600");
	    }

    |		lv_ops_0_10=RULE_EXPRESSION_500
		{
			newLeafNode(lv_ops_0_10, grammarAccess.getExpression0Access().getOpsEXPRESSION_500TerminalRuleCall_0_0_0_9()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_10, 
        		"EXPRESSION_500");
	    }

    |		lv_ops_0_11=RULE_EXPRESSION_400
		{
			newLeafNode(lv_ops_0_11, grammarAccess.getExpression0Access().getOpsEXPRESSION_400TerminalRuleCall_0_0_0_10()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_11, 
        		"EXPRESSION_400");
	    }

    |		lv_ops_0_12=RULE_EXPRESSION_200
		{
			newLeafNode(lv_ops_0_12, grammarAccess.getExpression0Access().getOpsEXPRESSION_200TerminalRuleCall_0_0_0_11()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"ops",
        		lv_ops_0_12, 
        		"EXPRESSION_200");
	    }

)

)
)((
(
		lv_prefix_1_0=	'(' 
    {
        newLeafNode(lv_prefix_1_0, grammarAccess.getExpression0Access().getPrefixLeftParenthesisKeyword_0_1_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed($current, "prefix", true, "(");
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getExpsExpressionINFParserRuleCall_0_1_1_0()); 
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
)	otherlv_3=')' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getExpression0Access().getRightParenthesisKeyword_0_1_2());
    }
)?)
    |(
(
		lv_variable_4_0=RULE_VARIABLE
		{
			newLeafNode(lv_variable_4_0, grammarAccess.getExpression0Access().getVariableVARIABLETerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"variable",
        		lv_variable_4_0, 
        		"VARIABLE");
	    }

)
)
    |(
(
		lv_string_5_0=RULE_STRING
		{
			newLeafNode(lv_string_5_0, grammarAccess.getExpression0Access().getStringSTRINGTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getExpression0Rule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"string",
        		lv_string_5_0, 
        		"STRING");
	    }

)
)
    |(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getNumberNUMBERParserRuleCall_3_0()); 
	    }
		lv_number_6_0=ruleNUMBER		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		set(
       			$current, 
       			"number",
        		lv_number_6_0, 
        		"NUMBER");
	        afterParserOrEnumRuleCall();
	    }

)
)
    |((
(
		lv_list_7_0=	'[' 
    {
        newLeafNode(lv_list_7_0, grammarAccess.getExpression0Access().getListLeftSquareBracketKeyword_4_0_0());
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
	        newCompositeNode(grammarAccess.getExpression0Access().getHeadsExpressionINFParserRuleCall_4_1_0_0()); 
	    }
		lv_heads_8_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"heads",
        		lv_heads_8_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_9='|' 
    {
    	newLeafNode(otherlv_9, grammarAccess.getExpression0Access().getVerticalLineKeyword_4_1_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getTailsExpressionINFParserRuleCall_4_1_1_1_0()); 
	    }
		lv_tails_10_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"tails",
        		lv_tails_10_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
))?)?	otherlv_11=']' 
    {
    	newLeafNode(otherlv_11, grammarAccess.getExpression0Access().getRightSquareBracketKeyword_4_2());
    }
)
    |(	otherlv_12='(' 
    {
    	newLeafNode(otherlv_12, grammarAccess.getExpression0Access().getLeftParenthesisKeyword_5_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getExpression0Access().getExpsExpressionINFParserRuleCall_5_1_0()); 
	    }
		lv_exps_13_0=ruleExpressionINF		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getExpression0Rule());
	        }
       		add(
       			$current, 
       			"exps",
        		lv_exps_13_0, 
        		"ExpressionINF");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_14=')' 
    {
    	newLeafNode(otherlv_14, grammarAccess.getExpression0Access().getRightParenthesisKeyword_5_2());
    }
))
;





// Entry rule entryRuleNUMBER
entryRuleNUMBER returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getNUMBERRule()); } 
	 iv_ruleNUMBER=ruleNUMBER 
	 { $current=$iv_ruleNUMBER.current.getText(); }  
	 EOF 
;

// Rule NUMBER
ruleNUMBER returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
	kw='-' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getHyphenMinusKeyword_0()); 
    }
)?(    this_DIGIT_1=RULE_DIGIT    {
		$current.merge(this_DIGIT_1);
    }

    { 
    newLeafNode(this_DIGIT_1, grammarAccess.getNUMBERAccess().getDIGITTerminalRuleCall_1()); 
    }
)+(
	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getFullStopKeyword_2_0()); 
    }
(    this_DIGIT_3=RULE_DIGIT    {
		$current.merge(this_DIGIT_3);
    }

    { 
    newLeafNode(this_DIGIT_3, grammarAccess.getNUMBERAccess().getDIGITTerminalRuleCall_2_1()); 
    }
)+)?((
	kw='e' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getEKeyword_3_0_0()); 
    }

    |
	kw='E' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getEKeyword_3_0_1()); 
    }
)(
	kw='+' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getPlusSignKeyword_3_1_0()); 
    }

    |
	kw='-' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getNUMBERAccess().getHyphenMinusKeyword_3_1_1()); 
    }
)?(    this_DIGIT_8=RULE_DIGIT    {
		$current.merge(this_DIGIT_8);
    }

    { 
    newLeafNode(this_DIGIT_8, grammarAccess.getNUMBERAccess().getDIGITTerminalRuleCall_3_2()); 
    }
)+)?)
    ;





RULE_EXPRESSION_1200 : ('-->'|':-');

RULE_EXPRESSION_1200FX : '?-';

RULE_EXPRESSION_1100 : (';'|'|');

RULE_EXPRESSION_1000 : ',';

RULE_EXPRESSION_900FX : ('\\+'|'not');

RULE_EXPRESSION_700 : ('<'|'='|'=..'|'=@='|'=:='|'=<'|'=='|'=\\='|'>'|'>='|'@<'|'@=<'|'@>'|'@>='|'\\='|'\\=='|'is');

RULE_EXPRESSION_600 : ':';

RULE_EXPRESSION_500 : ('+'|'-'|'/\\'|'\\/'|'xor');

RULE_EXPRESSION_400 : ('*'|'/'|'//'|'rdiv'|'<<'|'>>'|'mod'|'rem');

RULE_EXPRESSION_200 : ('**'|'^');

RULE_ATOM : 'a'..'z' ('0'..'9'|'a'..'z'|'A'..'Z'|'_')*;

RULE_VARIABLE : ('A'..'Z'|'_') ('0'..'9'|'a'..'z'|'A'..'Z'|'_')*;

RULE_STRING : '\'' ('0'..'9'|'a'..'z'|'A'..'Z'|'_'|'+'|'-'|'*'|'/'|'\\'|'^'|'~'|':'|'.'|'?'|'@'|'#'|'$'|'&'|' ')* '\'';

RULE_DIGIT : '0'..'9';

RULE_WHITESPACE : (' '|'\t'|'\r'|'\n')+;

RULE_SINGLE_LINE_COMMENT : '%' ~(('\n'|'\r'))* ('\r'? '\n')?;


