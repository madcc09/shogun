# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'

ground_truth = LoadMatrix.load_labels('../data/label_train_twoclass.dat')
random.seed(17)
predicted = random.randn(len(ground_truth))

parameter_list = [[ground_truth,predicted]]

def evaluation_contingencytableevaluation_modular(ground_truth, predicted)

	ground_truth_labels = Labels(ground_truth)
	predicted_labels = Labels(predicted)
	
	base_evaluator = ContingencyTableEvaluation()
	base_evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = AccuracyMeasure()	
	accuracy = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = ErrorRateMeasure()
	errorrate = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = BALMeasure()
	bal = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = WRACCMeasure()
	wracc = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = F1Measure()
	f1 = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = CrossCorrelationMeasure()
	crosscorrelation = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = RecallMeasure()
	recall = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = PrecisionMeasure()
	precision = evaluator.evaluate(predicted_labels,ground_truth_labels)

	evaluator = SpecificityMeasure()
	specificity = evaluator.evaluate(predicted_labels,ground_truth_labels)

	return accuracy, errorrate, bal, wracc, f1, crosscorrelation, recall, precision, specificity



end
if __FILE__ == $0
	puts 'ContingencyTableEvaluation'
	evaluation_contingencytableevaluation_modular(*parameter_list[0])


end