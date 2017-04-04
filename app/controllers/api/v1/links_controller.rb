require 'uri'

class Api::V1::LinksController < ApplicationController
include URI
  def create
    new_link = Link.new(link_params)

    if valid_url?(new_link.url) && new_link.save

    elsif
      render json: {
        :error => "URL is not valid",
        :other_errors => new_link.errors.full_messages
      }, status: 400
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private

    def link_params
      params.permit(:title, :url, :user_id)
    end

    def valid_url?(uri)
      uri = URI.parse(uri)
      uri.kind_of? URI::HTTP
      rescue URI::InvalidURIError
        false
    end
end
