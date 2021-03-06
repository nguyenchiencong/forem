module Forem
  module Admin
    class BaseController < ApplicationController
      before_filter :authenticate_forem_admin

      def index
        # TODO: perhaps gather some stats here to show on the admin page?
      end

      private

      def authenticate_forem_admin
        if !current_user || !current_user.forem_admin?
          flash[:error] = t("forem.errors.access_denied")
          redirect_to forums_path #TODO: not positive where to redirect here
        end
      end
    end
  end
end