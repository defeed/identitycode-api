class IsikukoodController < ApplicationController
  require 'identity_code'

  def index
    render nothing: true
  end

  def generate
    opts = {}
    count = params[:count].to_i <= 0 ? 10 : params[:count].to_i
    opts[:sex] = params[:sex].upcase if params[:sex]
    opts[:year] = params[:year].to_i if params[:year]
    opts[:month] = params[:month].to_i if params[:month]
    opts[:day] = params[:day].to_i if params[:day]
    opts[:safe_age] = true unless params[:safe_age] == 'false'

    codes = []
    count.times do
      codes << { identityCode: IdentityCode::Isikukood.generate(opts) }
    end

    render json: codes
  end

  def random
    render json: {
      identityCode: IdentityCode::Isikukood.generate(safe_age: true)
    }
  end

  def validate
    code = params[:code]
    render json: { error: 'Identity code not provided' },
           status: 422 and return unless code

    identity_code = IdentityCode::Isikukood.new(code)

    render json: {
      identityCodecode: code,
      isValid: identity_code.valid?,
      sex: identity_code.sex,
      birthDate: identity_code.birth_date,
      age: identity_code.age
    }
  end
end
