# main.py
from fastapi import FastAPI
from model.user import UserRouter
from model.students import StudentRouter
from model.administrator import AdministratorRouter
from model.account_approval import AccountApprovalRouter
from model.document_type import DocumentTypeRouter
from model.document_request import DocumentRequestRouter
from model.document_request_item import DocumentRequestItemRouter
from model.document_transaction import DocumentTransactionRouter
from model.admin_approval import AdminApprovalRouter
from model.claiming_information import ClaimingInformationRouter
from model.courier_information import CourierInformationRouter
from model.user_transaction_history import UserTransactionHistoryRouter
from model.user_feedback import UserFeedbackRouter
 
app = FastAPI()
 # Include CRUD routes from modules
app.include_router(UserRouter, prefix="/api")
app.include_router(StudentRouter, prefix="/api")
app.include_router(AdministratorRouter, prefix="/api")
app.include_router(AccountApprovalRouter, prefix="/api")
app.include_router(DocumentTypeRouter, prefix="/api")
app.include_router(DocumentRequestRouter, prefix="/api")
app.include_router(DocumentRequestItemRouter, prefix="/api")
app.include_router(DocumentTransactionRouter, prefix="/api")
app.include_router(AdminApprovalRouter, prefix="/api")
app.include_router(ClaimingInformationRouter, prefix="/api")
app.include_router(CourierInformationRouter, prefix="/api")
app.include_router(UserTransactionHistoryRouter, prefix="/api")
app.include_router(UserFeedbackRouter, prefix="/api")