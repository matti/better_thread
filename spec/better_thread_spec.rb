# frozen_string_literal: true

RSpec.describe BetterThread do
  it "without opts" do
    called = false
    bt = BetterThread.new do
      called = true
    end

    bt.join

    expect(called).to eq true
  end

  it "with opts" do
    called = false
    bt = BetterThread.new timeout: 0.1 do
      sleep 0.3
      called = true
    end

    bt.join
    expect(called).to eq false
    expect(bt.timeout?).to eq true
  end
end
