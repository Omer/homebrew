require 'formula'

class SvmLight < Formula
  url 'http://osmot.cs.cornell.edu/svm_light/v6.02/svm_light.tar.gz'
  version '6.02'
  homepage 'http://svmlight.joachims.org/'
  md5 '59768adde96737b1ecef123bc3a612ce'

  def options
    [
      ['--libsvmlight_hideo', "builds shared object library that can be linked into other code using HIDEO"]
    ]
  end

  def install
    system "make all"
    bin.install ['svm_learn', 'svm_classify']

    if ARGV.include? "--libsvmlight_hideo"
      system "make libsvmlight_hideo"
      (include+'svm_light').install Dir['*.h', '*.o']
      lib.install Dir['*.so']
    end
  end
end
