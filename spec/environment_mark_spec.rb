# frozen_string_literal: true

RSpec.describe EnvironmentMark do
  it 'has a version number' do
    expect(EnvironmentMark::VERSION).not_to be nil
  end

  describe '#configure' do
    let(:config) { OpenStruct.new(application: OpenStruct.new(config: nil)) }
    subject { described_class.configure(config) }

    before { stub_const("#{described_class}::APP_ENV", app_env) }
    after { subject }

    context 'production' do
      let(:app_env) { described_class::PRODUCTION_APP_ENV }
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      it 'shouldnt enable' do
        expect(described_class).not_to receive(:enable!)
      end
    end

    context 'staging' do
      let(:app_env) { described_class::STAGING_APP_ENV }
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      it 'should enable, set staging label and set right theme' do
        expect(described_class).to receive(:enable!).once
        expect(described_class).to receive(:label!).with(config, described_class::STAGING_APP_ENV).once
        expect(described_class).to receive(:theme!).with(config, described_class.right_theme).once
      end
    end

    context 'development' do
      let(:app_env) { described_class::DEVELOPMENT_APP_ENV }
      before { allow(Rails.env).to receive(:production?).and_return(true) }

      it 'should enable, set staging label and set right theme' do
        expect(described_class).to receive(:enable!).once
        expect(described_class).to receive(:label!).with(config, described_class::DEVELOPMENT_APP_ENV).once
        expect(described_class).to receive(:theme!).with(config, described_class.right_theme).once
      end
    end

    context 'local' do
      let(:app_env) { described_class::LOCAL_APP_ENV }
      before { allow(Rails.env).to receive(:development?).and_return(true) }

      it 'should enable, set staging label and set right theme' do
        expect(described_class).to receive(:enable!).once
        expect(described_class).to receive(:label!).with(config, described_class::LOCAL_APP_ENV).once
        expect(described_class).to receive(:theme!).with(config, described_class.right_theme).once
      end
    end
  end
end
