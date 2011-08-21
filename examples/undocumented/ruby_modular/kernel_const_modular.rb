# this was trancekoded by the awesome trancekoder
# ...and fixifikated by the awesum fixifikator
require 'modshogun'
require 'pp'
parameter_list =[[23],[24]]

def kernel_const_modular(c=23)

# *** 	feats_train=DummyFeatures(10)
	feats_train=Modshogun::DummyFeatures.new
	feats_train.set_features(10)
# *** 	feats_test=DummyFeatures(17)
	feats_test=Modshogun::DummyFeatures.new
	feats_test.set_features(17)
	
# *** 	kernel=ConstKernel(feats_train, feats_train, c)
	kernel=Modshogun::ConstKernel.new
	kernel.set_features(feats_train, feats_train, c)

	km_train=kernel.get_kernel_matrix()
	kernel.init(feats_train, feats_test)
	km_test=kernel.get_kernel_matrix()
	return km_train,km_test,kernel


end
if __FILE__ == $0
	puts 'Const'
	kernel_const_modular(*parameter_list[0])

end