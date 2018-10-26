class NetworkController < ApplicationController
    def sendInvite
        inv = Invite.create(
            user_id: session[:user_id],
            heval_id: params[:heval_id])
        redirect_to "/users",
            notice: "Invite succesfully sent"
    end

    def acceptInvite
        inv = Invite.find_by(
            user_id: params[:heval_id],
            heval_id: session[:user_id])
        inv.connected = true
        inv.save
        redirect_to "/professional_profile",
            notice: "Invite Accepted"
    end

    def ignoreInvite
        inv = Invite.find_by(
            user_id: params[:heval_id],
            heval_id: session[:user_id])
        inv.connected = false
        inv.save
        redirect_to "/professional_profile",
            notice: "Invite ignored"
    end
end

# <tbody>
#     <% @users.each do |user| %>
#         <% if @inv.find_by(heval_id: user.id) == nil %>
#         <% else @inv.find_by(heval_id: user.id).connected == nil %>
#             <% if user.id != current_user.id %>
#
# 
#                 <tr>
#                     <td>
#                         <a href="/users/<%= user.id %>">
#                             <%= user.name %>
#                         </a>
#                     </td>
#
#                     <td>
#                         <form action="/network/send/<%= user.id %>" method="post">
#                             <input type="hidden" name="authenticity_token"
#                                 value="<%= form_authenticity_token %>">
#
#                             <input type="submit" value="Invite">
#                         </form>
#                     </td>
#                 </tr>
#
#             <% end %>
#         <% end %>
#     <% end %>
# </tbody>
