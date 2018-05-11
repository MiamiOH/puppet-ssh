require 'spec_helper'

describe 'ssh' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with defaults' do
        it { is_expected.to compile }
        if os_facts[:osfamily] == 'RedHat'
          it { is_expected.to contain_package('ssh-redhat') }
        elsif os_facts[:osfamily] == 'Debian'
          it { is_expected.to contain_package('ssh-debian') }
        end
      end

      context 'if I set package' do
        let(:params) { { 'package' => 'ssh-solaris' } }

        it { is_expected.to contain_package('ssh-solaris') }
      end
    end
  end
end
