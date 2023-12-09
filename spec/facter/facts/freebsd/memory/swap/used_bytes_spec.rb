# frozen_string_literal: true

describe Facts::Freebsd::Memory::Swap::UsedBytes do
  describe '#call_the_resolver' do
    subject(:fact) { Facts::Freebsd::Memory::Swap::UsedBytes.new }

    let(:value) { 1024 }

    before do
      allow(Facter::Resolvers::Freebsd::SwapMemory).to receive(:resolve).with(:used_bytes).and_return(value)
    end

    it 'returns a fact' do
      expect(fact.call_the_resolver).to be_an_instance_of(Facter::ResolvedFact).and \
        have_attributes(name: 'memory.swap.used_bytes', value: value)
    end
  end
end
