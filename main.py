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
from model.new_accounts import NewAccountsRouter
from model.add_student_user import AddStudentUserRouter
from model.add_admin_user import AddAdminUserRouter
from model.payment import PaymentsRouter
from fastapi.middleware.cors import CORSMiddleware

from time import time
from fastapi import FastAPI, __version__
from fastapi.staticfiles import StaticFiles
from fastapi.responses import HTMLResponse

app = FastAPI()
app.mount("/static", StaticFiles(directory="static"), name="static")




app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"],
    allow_headers=["*"],
)

# Include CRUD routes from modules
app.include_router(PaymentsRouter, prefix="/api")
app.include_router(NewAccountsRouter, prefix="/api")
app.include_router(AddStudentUserRouter, prefix="/api")
app.include_router(AddAdminUserRouter, prefix="/api")

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



html = f"""
<!DOCTYPE html>
<html>
    <head>
        <title>FastAPI on Vercel</title>
        <link rel="icon" href="/static/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div class="bg-gray-200 p-4 rounded-lg shadow-lg">
            <h1>Hello from FastAPI@{__version__}</h1>
            <ul>
                <li><a href="/docs">/docs</a></li>
                <li><a href="/redoc">/redoc</a></li>
            </ul>
            <p>Powered by <a href="https://vercel.com" target="_blank">Vercel</a></p>
        </div>
    </body>
</html>
"""

@app.get("/")
async def root():
    return HTMLResponse(html)

@app.get('/ping')
async def hello():
    return {'res': 'pong', 'version': __version__, "time": time()}