# frozen_string_literal: true

require "spec_helper"
require "integration/support/server"
require "json"
require "ostruct"
require "logger"

describe "Options" do

  before :all do
    @server = IntegrationServer.run
  end

  after :all do
    @server.stop
  end

  context "global :element_form_default" do
    it "qualifies elements embedded in complex types" do
      client = new_client(:endpoint => @server.url(:repeat),
                          :wsdl => Fixture.wsdl(:elements_in_types))
      msg = {":TopLevelTransaction"=>{":Qualified"=>"A Value"}}

      response = client.call(:top_level_transaction, :message => msg)

      expect(response.http.body.scan(/<tns:Qualified>/).count).to eq(1)
    end
  end

  def new_client(globals = {}, &block)
    globals = { :wsdl => Fixture.wsdl(:authentication), :log => false }.merge(globals)
    Savon.client(globals, &block)
  end

  def new_client_without_wsdl(globals = {}, &block)
    globals = { :log => false }.merge(globals)
    Savon.client(globals, &block)
  end

  def inspect_request(response)
    hash = JSON.parse(response.http.body)
    OpenStruct.new(hash)
  end

end
