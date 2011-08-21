# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'
parameter_list=[[5,1,10, 2.0, 10], [10,0.3,2, 1.0, 0.1]]

def check_status(status)
	# silent...
	assert(status)
	#if  status:
	#	puts "OK reading/writing .h5\n"
	#else:
	#	puts "ERROR reading/writing .h5\n"


end
def serialization_complex_example(num=5, dist=1, dim=10, C=2.0, width=10):
	import os
			SerializableJsonFile,SerializableXmlFile,MSG_DEBUG

	seed(17)

	data=concatenate((randn(dim, num), randn(dim, num) + dist,
					  randn(dim, num) + 2*dist,
					  randn(dim, num) + 3*dist), axis=1)
	lab=concatenate((zeros(num), ones(num), 2*ones(num), 3*ones(num)))

# *** 	feats=RealFeatures(data)
	feats=Modshogun::RealFeatures.new
	feats.set_features(data)
	#feats.io.set_loglevel(MSG_DEBUG)
# *** 	kernel=GaussianKernel(feats, feats, width)
	kernel=Modshogun::GaussianKernel.new
	kernel.set_features(feats, feats, width)

# *** 	labels=Labels(lab)
	labels=Modshogun::Labels.new
	labels.set_features(lab)

	svm = GMNPSVM(C, kernel, labels)

	feats.add_preprocessor(NormOne())
	feats.add_preprocessor(LogPlusOne())
	feats.set_preprocessed(1)
	svm.train(feats)

	#svm.print_serializable()

	fstream = SerializableHdf5File("blaah.h5", "w")
	status = svm.save_serializable(fstream)
	check_status(status)

	fstream = SerializableAsciiFile("blaah.asc", "w")
	status = svm.save_serializable(fstream)
	check_status(status)

	fstream = SerializableJsonFile("blaah.json", "w")
	status = svm.save_serializable(fstream)
	check_status(status)

	fstream = SerializableXmlFile("blaah.xml", "w")
	status = svm.save_serializable(fstream)
	check_status(status)


	fstream = SerializableHdf5File("blaah.h5", "r")
# *** 	new_svm=GMNPSVM()
	new_svm=Modshogun::GMNPSVM.new
	new_svm.set_features()
	status = new_svm.load_serializable(fstream)
	check_status(status)
	new_svm.train()

	fstream = SerializableAsciiFile("blaah.asc", "r")
# *** 	new_svm=GMNPSVM()
	new_svm=Modshogun::GMNPSVM.new
	new_svm.set_features()
	status = new_svm.load_serializable(fstream)
	check_status(status)
	new_svm.train()

	fstream = SerializableJsonFile("blaah.json", "r")
# *** 	new_svm=GMNPSVM()
	new_svm=Modshogun::GMNPSVM.new
	new_svm.set_features()
	status = new_svm.load_serializable(fstream)
	check_status(status)
	new_svm.train()

	fstream = SerializableXmlFile("blaah.xml", "r")
# *** 	new_svm=GMNPSVM()
	new_svm=Modshogun::GMNPSVM.new
	new_svm.set_features()
	status = new_svm.load_serializable(fstream)
	check_status(status)
	new_svm.train()

	os.unlink("blaah.h5")
	os.unlink("blaah.asc")
	os.unlink("blaah.json")
	os.unlink("blaah.xml")
	return svm,new_svm



end
if __FILE__ == $0
	puts 'Serialization SVMLight'
	serialization_complex_example(*parameter_list[0])

end