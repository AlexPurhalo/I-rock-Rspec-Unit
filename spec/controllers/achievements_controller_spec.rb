# require 'rails_helper'
#
# describe AchievementsController do
#   shared_examples "public access to achievements" do
#     describe "GET index" do
#       it "renders :index templage" do
#         get :index
#         expect(response).to render_template(:index)
#       end
#
#       it "assigns only public achievements to template" do
#         public_achievement = FactoryGirl.create(:public_achievement)
#
#         get :index
#         expect(assigns(:achievements)).to match_array([public_achievement])
#       end
#     end
#
#     describe "GET show" do
#       let(:achievement) { FactoryGirl.create(:public_achievement) }
#       it "renders :show template" do
#         get :show, id: achievement.id
#         expect(response).to render_template(:show)
#       end
#       it "assigns request achievement to @achievement" do
#         get :show, id: achievement.id
#         expect(assigns(:achievement)).to eq(achievement)
#       end
#     end
#   end
#
#   describe "guest user" do
#     it_behaves_like "public access to achievements"
#
#     describe "GET new" do
#       it "redirects to login page" do
#         get :new
#         expect(response).to redirect_to(new_user_session_url)
#       end
#     end
#
#     describe "GET edit" do
#       it "redirects to login page" do
#         get :edit, id: FactoryGirl.create(:public_achievement)
#         expect(response).to redirect_to(new_user_session_url)
#       end
#     end
#
#     describe "PUT update" do
#       it "redirects to login page" do
#         put :update, id: FactoryGirl.create(:public_achievement), achievement: FactoryGirl.attributes_for(:public_achievement)
#         expect(response).to redirect_to(new_user_session_url)
#       end
#     end
#
#     describe "GET destroy" do
#       it "redirects to login page" do
#         delete :destroy, id: FactoryGirl.create(:public_achievement)
#         expect(response).to redirect_to(new_user_session_url)
#       end
#     end
#   end
#
#   describe "authenticated user" do
#     let(:user) { FactoryGirl.create(:user) }
#     before do
#       sign_in(user)
#     end
#
#     it_behaves_like "public access to achievements"
#
#     describe "GET new" do
#       it "renders :new template" do
#         get :new
#         expect(response).to render_template(:new)
#       end
#
#       it "assigns new Achievement to @achievement" do
#         get :new
#         expect(assigns(:achievement)).to be_a_new(Achievement)
#       end
#     end
#
#     describe "POST create" do
#       context "valid data" do
#         let(:valid_data) { FactoryGirl.attributes_for(:public_achievement) }
#         it "creates new achievement in database" do
#           expect {
#             post :create, achievement: valid_data
#           }.to change(Achievement, :count).by(1)
#         end
#
#         it "redirect to achievements#show" do
#           post :create, achievement: valid_data
#           expect(response).to redirect_to(achievement_path(assigns[:achievement]))
#         end
#       end
#
#       context "invalid data" do
#         let(:invalid_data) { FactoryGirl.attributes_for(:public_achievement, title: '') }
#         it "doesn't create new achievement in the database" do
#           expect {
#             post :create, achievement: invalid_data
#           }.not_to change(Achievement, :count)
#         end
#
#         it "renders :new template" do
#           post :create, achievement: invalid_data
#           expect(response).to render_template(:new)
#         end
#       end
#     end
#
#     context 'is not the owner of the achievement' do
#       describe "GET edit" do
#         it "redirects to achievements page" do
#           get :edit, id: FactoryGirl.create(:public_achievement)
#           expect(response).to redirect_to(achievements_path)
#         end
#       end
#
#       describe "PUT update" do
#         it "redirects to achievements page" do
#           put :update, id: FactoryGirl.create(:public_achievement), achievement: FactoryGirl.attributes_for(:public_achievement)
#           expect(response).to redirect_to(achievements_path)
#         end
#       end
#
#       describe "GET destroy" do
#         it "redirects to achievements page" do
#           delete :destroy, id: FactoryGirl.create(:public_achievement)
#           expect(response).to redirect_to(achievements_path)
#         end
#       end
#     end
#
#     context 'is the owner of the achievement' do
#       let(:achievement) { FactoryGirl.create(:public_achievement, user: user) }
#
#       describe "GET edit" do
#         it "renders :edit template" do
#           get :edit, id: achievement
#           expect(response).to render_template(:edit)
#         end
#
#         it "assings the requested achievement to template" do
#           get :edit, id: achievement
#           expect(assigns(:achievement))
#         end
#       end
#
#       describe "PUT update" do
#         context "valid data" do
#           let(:valid_data) { FactoryGirl.attributes_for(:public_achievement, title: "New Title")}
#
#           it "updates achievement in the dtatbase" do
#             put :update, id: achievement, achievement: valid_data
#             achievement.reload
#             expect(achievement.title).to eq("New Title")
#           end
#
#           it "redirects to achievements#show" do
#             put :update, id: achievement, achievement: valid_data
#             expect(response).to redirect_to(achievement)
#           end
#         end
#
#         context "invalid data" do
#           let(:invalid_data) { FactoryGirl.attributes_for(:public_achievement, title: "", description: "new")}
#
#           it "doesn't update achievement in the database" do
#             put :update, id: achievement, achievement: invalid_data
#             achievement.reload
#             expect(achievement.description).not_to eq("new")
#           end
#
#           it "renders :edit template" do
#             put :update, id: achievement, achievement: invalid_data
#             expect(response).to render_template(:edit)
#           end
#         end
#       end
#
#       describe "DELETE destroy" do
#         it "deletes achievement from database" do
#           delete :destroy, id: achievement
#           expect(Achievement.exists?(achievement.id)).to be_falsy
#         end
#
#         it "redirects to achievements#index" do
#           delete :destroy, id: achievement
#           expect(response).to redirect_to(achievements_path)
#         end
#       end
#     end
#   end
#
#   # describe "GET edit" do
#   #   let(:achievement) { FactoryGirl.create(:public_achievement) }
#   #
#   #   it "renders :edit template" do
#   #     get :edit, id: achievement
#   #     expect(response).to render_template(:edit)
#   #   end
#   #
#   #   it "assings the requested achievement to template" do
#   #     get :edit, id: achievement
#   #     expect(assigns(:achievement))
#   #   end
#   # end
#   #
#   # describe "GET new" do
#   #   it "renders :new template" do
#   #     get :new
#   #     expect(response).to render_template(:new)
#   #   end
#   #
#   #   it "assigns new Achievement to @achievement" do
#   #     get :new
#   #     expect(assigns(:achievement)).to be_a_new(Achievement)
#   #   end
#   # end
#   #
#   # describe "POST create" do
#   #   context "valid data" do
#   #     let(:valid_data) { FactoryGirl.attributes_for(:public_achievement) }
#   #     it "creates new achievement in database" do
#   #       expect {
#   #         post :create, achievement: valid_data
#   #       }.to change(Achievement, :count).by(1)
#   #     end
#   #
#   #     it "redirect to achievements#show" do
#   #       post :create, achievement: valid_data
#   #       expect(response).to redirect_to(achievement_path(assigns[:achievement]))
#   #     end
#   #   end
#   #
#   #   context "invalid data" do
#   #     let(:invalid_data) { FactoryGirl.attributes_for(:public_achievement, title: '') }
#   #     it "doesn't create new achievement in the database" do
#   #       expect {
#   #         post :create, achievement: invalid_data
#   #       }.not_to change(Achievement, :count)
#   #     end
#   #
#   #     it "renders :new template" do
#   #       post :create, achievement: invalid_data
#   #       expect(response).to render_template(:new)
#   #     end
#   #   end
#   # end
#   #
#   # describe "PUT update" do
#   #   let(:achievement) { FactoryGirl.create(:public_achievement) }
#   #   context "valid data" do
#   #     let(:valid_data) { FactoryGirl.attributes_for(:public_achievement, title: "New Title")}
#   #
#   #     it "updates achievement in the dtatbase" do
#   #       put :update, id: achievement, achievement: valid_data
#   #       achievement.reload
#   #       expect(achievement.title).to eq("New Title")
#   #     end
#   #
#   #     it "redirects to achievements#show" do
#   #       put :update, id: achievement, achievement: valid_data
#   #       expect(response).to redirect_to(achievement)
#   #     end
#   #   end
#   #
#   #   context "invalid data" do
#   #     let(:invalid_data) { FactoryGirl.attributes_for(:public_achievement, title: "", description: "new")}
#   #
#   #     it "doesn't update achievement in the database" do
#   #       put :update, id: achievement, achievement: invalid_data
#   #       achievement.reload
#   #       expect(achievement.description).not_to eq("new")
#   #     end
#   #
#   #     it "renders :edit template" do
#   #       put :update, id: achievement, achievement: invalid_data
#   #       expect(response).to render_template(:edit)
#   #     end
#   #   end
#   # end
#   #
#   # describe "DELETE destroy" do
#   #   let(:achievement) { FactoryGirl.create(:public_achievement) }
#   #
#   #   it "deletes achievement from database" do
#   #     delete :destroy, id: achievement
#   #     expect(Achievement.exists?(achievement.id)).to be_falsy
#   #   end
#   #
#   #   it "redirects to achievements#index" do
#   #     delete :destroy, id: achievement
#   #     expect(response).to redirect_to(achievements_path)
#   #   end
#   # end
# end
