require 'question'

RSpec.describe Question do
  let(:params) do
    {text: 'Kak dela?', answers: ['ok', 'ne ok'], right_answer: 'ok', points: 5, time: 10}
  end
  let(:question) { described_class.new(params) }
  let(:answers) { ['ok', 'ne ok'] }

  before { allow_any_instance_of(Array).to receive(:shuffle).and_return(answers) }

  describe '.new' do
    subject { described_class.new(params) }

    it do
      is_expected.to have_attributes(
        text: 'Kak dela?', answers: ['ok', 'ne ok'], right_answer: 'ok', points: 5, time: 10
      )
    end
  end

  describe '#right_answer?' do
    subject { question.right_answer?(answer) }
    let(:answer) { 1 }

    context 'when answer is correct' do
      it { is_expected.to eq true }
    end

    context 'when answer is wrong' do
      let(:answers) { ['ne ok', 'ok'] }

      it { is_expected.to eq false }
    end
  end

  describe '#to_s' do
    subject { question.to_s }
    let(:expected_string) do
      <<~EXPECTED_STRING
        Kak dela? (баллов: 5, время 10 сек.)
        1. ok
        2. ne ok
      EXPECTED_STRING
    end

    it { is_expected.to eq expected_string }
  end
end
