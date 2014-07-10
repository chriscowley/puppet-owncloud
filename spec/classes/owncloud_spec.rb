require 'spec_helper'

describe 'owncloud' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "owncloud class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('owncloud::params') }
        it { should contain_class('owncloud::install').that_comes_before('owncloud::config') }
        it { should contain_class('owncloud::config') }
        #it { should contain_class('owncloud::service').that_subscribes_to('owncloud::config') }

        #it { should contain_service('owncloud') }
        #it { should contain_package('owncloud').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'owncloud class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('owncloud') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
