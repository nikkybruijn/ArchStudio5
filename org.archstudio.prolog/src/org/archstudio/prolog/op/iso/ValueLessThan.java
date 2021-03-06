package org.archstudio.prolog.op.iso;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.archstudio.prolog.engine.PrologUtils;
import org.archstudio.prolog.engine.ProofContext;
import org.archstudio.prolog.engine.UnificationEngine;
import org.archstudio.prolog.op.Executable;
import org.archstudio.prolog.term.ComplexTerm;
import org.archstudio.prolog.term.Term;
import org.archstudio.prolog.term.VariableTerm;

public class ValueLessThan extends ComplexTerm implements Executable {

	public ValueLessThan(String name, List<? extends Term> terms) {
		super(name, 2, terms);
	}

	@Override
	public Iterable<Map<VariableTerm, Term>> execute(ProofContext proofContext, UnificationEngine unificationEngine,
			Term source, Map<VariableTerm, Term> variables) {
		BigDecimal n1 = PrologUtils.toBigDecimal(PrologUtils.evaluate(proofContext, getTerm(0), variables));
		BigDecimal n2 = PrologUtils.toBigDecimal(PrologUtils.evaluate(proofContext, getTerm(1), variables));
		return n1.compareTo(n2) < 0 ? Collections.singleton(variables) : PrologUtils.emptyVariablesList();
	}
}
